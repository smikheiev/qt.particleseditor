import QtQuick.Controls 2.2
import QtQuick 2.9

import QuickFlux 1.0

import PE.ControlType 1.0
import PE.Actions 1.0

Item {
    id: controlSettingsArea

    QtObject {
        id: priv

        property Item scene
        property QtObject currentControl

        function updateSettings(control) {
            var source = "";

            if (control) {
                currentControl = control;

                var controlType = control.controlType;
                if (ControlType.isAffector(controlType)) {
                    source += "affector/";
                } else if (ControlType.isDirection(controlType)) {
                    source += "direction/";
                } else if (ControlType.isParticle(controlType)) {
                    source += "particle/";
                } else if (ControlType.isShape(controlType)) {
                    source += "shape/";
                }
                source += "Settings" + controlType;
            } else {
                currentControl = scene;
                source += "SettingsScene";
            }
            source += ".qml";

            settingsLoader.setSource(source, { "control": currentControl });
        }
    }

    Flickable {
        id: settingsContainer

        anchors {
            fill: parent
            margins: 1
        }

        contentWidth: width
        contentHeight: settingsLoader.height

        ScrollBar.vertical: ScrollBar {}

        Loader {
            id: settingsLoader

            width: parent.width
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
                    priv.updateSettings(message.control);
                    break;
            }
        }
    }
}
