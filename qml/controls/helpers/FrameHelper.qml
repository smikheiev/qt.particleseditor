import QtQuick 2.9

import QuickFlux 1.0

import PE.ControlType 1.0
import PE.Settings 1.0
import PE.Actions 1.0

Item {
    id: frameHelper

    property Item control: null

    QtObject {
        id: priv

        property bool isSelected: false
    }

    anchors {
        fill: control
    }

    visible: Settings.showFrames

    Rectangle {
        id: borderRect

        anchors {
            fill: parent
        }

        color: "transparent"
        border.color: getBorderColor()
        border.width: priv.isSelected ? 3 : 1
    }

    MouseArea {
        id: mouseArea

        anchors {
            fill: parent
        }

        drag.target: control

        onPressed: {
            if (!priv.isSelected) {
                Actions.doControlSelected(control);
            }
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            if (type === Actions.controlSelected) {
                priv.isSelected = (message.control === frameHelper.control);
            }
        }
    }

    function getBorderColor() {
        if (ControlType.isEmitter(control.controlType)) {
            return Settings.emitterColor;
        }
        if (ControlType.isAffector(control.controlType)) {
            return Settings.affectorColor;
        }
        return "#FFFFFF";
    }
}
