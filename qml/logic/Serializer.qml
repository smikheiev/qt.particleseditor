import QtQuick 2.9

import QuickFlux 1.0

import PE.Actions 1.0
import PE.Common 1.0

QtObjectWithKids {
    id: serializer

    QtObject {
        id: priv

        property QtObject scene
        property var model: []

        function serializeModelToJson() {
            function recurse(node, array) {
                var obj = {};
                obj.controlType = node.data.controlType;
                obj.props = node.data.serializeHelper.serializeToJson();
                obj.kids = [];
                array.push(obj);

                for (var i in node.kids) {
                    recurse(node.kids[i], obj.kids);
                }
            }

            var serializedModel = [];
            for (var i in model) {
                recurse(model[i], serializedModel);
            }

            return serializedModel;
        }

        function deserializeModelFromJson(serializedModel) {
            function deserializeControl(controlData, parentControlData) {
                var controlType = controlData.controlType;
                var props = controlData.props;

                var parentControlId;
                if (parentControlData) {
                    parentControlId = parentControlData.props["uniqueId"];
                }
                Actions.doCreateControl(controlType, false, props, parentControlId);

                for (var i in controlData.kids) {
                    deserializeControl(controlData.kids[i], controlData);
                }
            }

            for (var i in serializedModel) {
                var controlData = serializedModel[i];
                deserializeControl(controlData);
            }
        }

        function serializeModelToQml() {
            function recurse(node, indent, callback) {
                var tabs = "";
                for (var i = 0; i < indent; ++i) {
                    tabs += "    ";
                }

                var controlQml = (tabs + node.data.controlType + " {" + "\n");
                controlQml += node.data.serializeHelper.serializePropsToQml(indent + 1);

                for (i in node.kids) {
                    recurse(node.kids[i], indent + 1, function(qml) {
                        controlQml += "\n";
                        controlQml += (tabs + qml);
                    });
                }

                controlQml += (tabs + "}" + "\n");
                callback(controlQml);
            }

            var result = "";
            for (var i in model) {
                recurse(model[i], 0, function(qml){
                    result += qml;
                });
            }

            return result;
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            var file, json, obj;
            switch (type) {
                case Actions.sceneCreated:
                    priv.scene = message.scene;
                    break;
                case Actions.modelUpdated:
                    priv.model = message.model;
                    break;
                case Actions.fileToSaveChosen:
                    file = message.file;

                    obj = {};
                    obj.tree = priv.serializeModelToJson();
                    obj.scene = priv.scene.serializeToJson();

                    json = JSON.stringify(obj);
                    _fileIO.saveFile(file, json);
                    break;
                case Actions.fileToOpenChosen:
                    file = message.file
                    json = _fileIO.readFile(file);
                    obj = JSON.parse(json);

                    if (obj.tree === undefined || obj.tree === undefined) {
                        throw new Erorr("Json file is wrong: ", file);
                    }

                    Actions.doRemoveAllControls();

                    priv.scene.deserializeFromJson(obj.scene);
                    priv.deserializeModelFromJson(obj.tree);
                    break;
                case Actions.serializeToQml:
                    var qml = priv.serializeModelToQml();
                    Actions.doOpenQmlExportDialog(qml);
                    break;
            }
        }
    }
}
