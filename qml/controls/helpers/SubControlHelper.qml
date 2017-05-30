import QtQuick 2.9

import PE.ControlsFactory 1.0
import PE.Common 1.0

// Helper for properties of type Shape and Direction of a control
QtObjectWithKids {
    id: subControlHelper

    readonly property bool hasDefaultValue: control && control[propertyName] === priv.defaultValue
    readonly property string valueType: hasDefaultValue ? "" : control[propertyName].controlType

    property QtObject control
    property string propertyName
    property var compareValueTypeFunction: function(valueType) { return false; }

    QtObject {
        id: priv

        property QtObject defaultValue
    }

    function setValueOfType(valueType) {
        var oldValue = control[propertyName];

        if (compareValueTypeFunction(valueType)) {
            control[propertyName] = ControlsFactory.createControl(valueType, control);
        } else {
            control[propertyName] = priv.defaultValue;
        }

        if (oldValue !== priv.defaultValue) {
            oldValue.destroy();
        }
    }

    function serializeToJson() {
        if (!hasDefaultValue) {
            return control[propertyName].serializeHelper.serializeToJson();
        }
        return undefined;
    }
    function deserializeFromJson(obj) {
        if (obj !== undefined) {
            setValueOfType(obj.controlType);
            control[propertyName].serializeHelper.deserializeFromJson(obj);
        }
    }
    function serializeToQml(indent) {
        if (!hasDefaultValue) {
            var tabs = "";
            for (var i = 0; i < indent; ++i) {
                tabs += "    ";
            }
            var qml = (control[propertyName].controlType + " {" + "\n");
            qml += control[propertyName].serializeHelper.serializePropsToQml(indent + 1);
            qml += (tabs + "}");
            return qml;
        }
        return undefined;
    }

    Component.onCompleted: {
        priv.defaultValue = control[propertyName]
    }
}
