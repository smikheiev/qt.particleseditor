import QtQuick 2.9

import QuickFlux 1.0

import PE.ControlsFactory 1.0
import PE.ControlType 1.0
import PE.Actions 1.0
import PE.Common 1.0

import "Tree.js" as Tree

QtObjectWithKids {
    id: logic

    Serializer {}

    QtObject {
        id: priv

        readonly property var tree: new Tree.Tree()
        readonly property var controlIds: []

        property QtObject selectedControl: null
        property QtObject scene

        function tryToChangeControlId(control, newId) {
            if (controlIds.indexOf(newId) >= 0) {
                Actions.doChangeControlIdError(control);
            } else {
                var previousIdIndex = controlIds.indexOf(control.uniqueId);

                control.uniqueId = newId;

                controlIds.splice(previousIdIndex, 1);
                controlIds.push(control.uniqueId);
            }
        }

        function createControl(controlType, controlProps, parentControlId, selectControl) {
            var control = ControlsFactory.createControl(controlType, scene.controlsContainer);
            if (!control) {
                throw new Error("Control was not created " + controlType);
            }

            if (controlProps) {
                control.serializeHelper.deserializeFromJson(controlProps);
            }

            var setupControlResult = setupControl(control, parentControlId);
            if (setupControlResult === false) {
                control.destroy();
            } else {
                addControlToModel(control, setupControlResult);
                if (selectControl) {
                    Actions.doControlSelected(control);
                }
            }
        }

        function setupControl(control, parentControlId) {
            var controlType = control.controlType;
            if (ControlType.isParticleSystem(controlType)) {
                return undefined;
            }

            var controlNeedsParticleSystem = ControlType.isEmitter(controlType) ||
                    ControlType.isParticle(controlType) || ControlType.isAffector(controlType);

            if (controlNeedsParticleSystem) {
                if (parentControlId === undefined && selectedControl === null) {
                    console.error("Impossible to get parent control for control: " + control);
                    return false;
                }

                var parentControl;
                if (parentControlId === undefined) {
                    parentControl = selectedControl;
                } else {
                    tree.traverse(function(node) {
                        if (node.data.uniqueId === parentControlId) {
                            parentControl = node.data;
                            return true;
                        }
                        return false;
                    });
                }

                if (!ControlType.isParticleSystem(parentControl.controlType)) {
                    parentControl = tree.getAnyParent(parentControl, function(c) {
                        return ControlType.isParticleSystem(c.controlType);
                    });
                }

                if (!ControlType.isParticleSystem(parentControl.controlType)) {
                    console.error("Can not get parent control for control: " + control);
                    return false;
                }

                control.system = parentControl;

                return parentControl;
            }

            return undefined;
        }

        function addControlToModel(control, parentControl) {
            tree.add(control, parentControl);
            controlIds.push(control.uniqueId);
            Actions.doModelUpdated(tree._root.kids);
        }

        function removeSelectedControl() {
            var controlToSelect = tree.getNeighbour(selectedControl);
            if (!controlToSelect) {
                controlToSelect = tree.getParent(selectedControl);
                if (controlToSelect === tree._root.data) {
                    controlToSelect = null;
                }
            }
            Actions.doControlSelected(controlToSelect);

            var controlsToDestroy = getControlsToDestroy(selectedControl);

            tree.remove(selectedControl);
            Actions.doModelUpdated(tree._root.kids);

            for (var i in controlsToDestroy) {
                var control = controlsToDestroy[i];

                // HACK: this is needed to avoid crash when removing Particle control
                if (ControlType.isParticle(control.controlType)) {
                    var particleSystem = control.system;
                    if (particleSystem.running) {
                        runParticleSystemWithDelay(particleSystem, 100)
                        particleSystem.running = false;
                    }
                }

                control.destroy();
            }
        }

        function removeAllControls() {
            Actions.doControlSelected(null);

            var allControlsToDestroy = [];

            while (tree._root.kids.length > 0) {
                var node = tree._root.kids[0];
                var nodeControlsToDestroy = getControlsToDestroy(node.data)
                // function "concat" doesn't work, that's why for loop is used
                for (var controlToDestroy in nodeControlsToDestroy) {
                    allControlsToDestroy.push(nodeControlsToDestroy[controlToDestroy])
                }
                tree.remove(node.data);
            }

            Actions.doModelUpdated(tree._root.kids);

            for (var i in allControlsToDestroy) {
                allControlsToDestroy[i].destroy();
            }
        }

        function getControlsToDestroy(control) {
            var node = tree.find(control);

            var controlsToDestroy = [];
            var nodes = [node];
            node = nodes.shift();
            while (node) {
                for (var i in node.kids) {
                    nodes.unshift(node.kids[i]);
                }
                controlsToDestroy.unshift(node.data);
                node = nodes.shift();
            }

            return controlsToDestroy;
        }

        function restartAllParticleSystems() {
            for (var i in tree._root.kids) {
                tree._root.kids[i].data.restart();
            }
        }

        function rerunParticleSystem(control, delayTime) {
            var particleSystem = null;
            if (ControlType.isParticleSystem(control.controlType)) {
                particleSystem = control;
            } else {
                particleSystem = tree.getAnyParent(control, function(c) {
                    return ControlType.isParticleSystem(c.controlType);
                });
            }
            if (!particleSystem) {
                console.error("Impossible to get particle system for control: " + control);
            }

            runParticleSystemWithDelay(particleSystem, delayTime);
            particleSystem.running = false;
        }

        function runParticleSystemWithDelay(particleSystem, delayTime) {
            if (delayTime > 0) {
                delay(delayTime, function() {
                    particleSystem.running = true;
                });
            } else {
                particleSystem.running = true;
            }
        }

        function delay(delayTime, callback) {
            var timer = Qt.createQmlObject("import QtQuick 2.9; Timer {}", logic);
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(function() {
                callback();
                timer.destroy();
            });
            timer.start();
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            switch (type) {
                case Actions.sceneCreated:
                    priv.scene = message.scene;
                    break;
                case Actions.controlSelected:
                    priv.selectedControl = message.control;
                    break;
                case Actions.changeControlId:
                    priv.tryToChangeControlId(message.control, message.newId);
                    break;
                case Actions.createControl:
                    priv.createControl(message.controlType, message.controlProps, message.parentControlId, message.selectControl);
                    break;
                case Actions.removeSelectedControl:
                    if (priv.selectedControl) {
                        priv.removeSelectedControl();
                    }
                    break;
                case Actions.removeAllControls:
                    priv.removeAllControls();
                    break;
                case Actions.deserializationDone:
                    priv.restartAllParticleSystems();
                    break;
                case Actions.rerunParticleSystem:
                    priv.rerunParticleSystem(message.control, message.delayTime);
                    break;
            }
        }
    }
}
