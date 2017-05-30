pragma Singleton

import QtQuick 2.9

import PE.ControlType 1.0
import PE.Common 1.0

QtObjectWithKids {
    id: controlsFactory

    QtObject {
        id: priv

        property int uniqueIdCounter: 0
    }

    function createControl(controlType, parent) {
        var url = "qrc:/controls/";
        if (ControlType.isParticle(controlType)) {
            url += "particle/";
        } else if (ControlType.isAffector(controlType)) {
            url += "affector/";
        } else if (ControlType.isDirection(controlType)) {
            url += "direction/";
        } else if (ControlType.isShape(controlType)) {
            url += "shape/";
        }
        url += controlType + ".qml"

        var component = Qt.createComponent(url, Component.PreferSynchronous);
        if (component.status !== Component.Ready) {
            throw new Error("Can not create component of type " + controlType);
        }

        var control = component.createObject(parent);

        var uniqueId = control.controlType + "_" + (++priv.uniqueIdCounter);
        uniqueId = uniqueId.charAt(0).toLowerCase() + uniqueId.slice(1);
        control.uniqueId = uniqueId;

        return control;
    }
}
