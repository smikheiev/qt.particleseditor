import QtQuick.Controls 2.2
import QtQuick 2.9

import QuickFlux 1.0

import PE.ControlType 1.0
import PE.Settings 1.0
import PE.Actions 1.0

Item {
    id: controlsTree

    QtObject {
        id: priv

        property var model: []
        property QtObject selectedControl: null
    }

    Column {
        id: rootLeavesColumn

        width: parent.width
        spacing: 2

        Repeater {
            model: priv.model

            delegate: leafComponent
        }
    }

    Component {
        id: leafComponent

        Column {
            id: leafDataColumn

            property QtObject control: modelData.data
            property bool isSelected: priv.selectedControl === control
            property string controlType: control ? control.controlType : ""
            property string uniqueId: control ? control.uniqueId : ""

            width: parent ? parent.width : 0
            spacing: parent ? parent.spacing : 0

            MouseArea {
                width: parent.width
                height: 30

                onClicked: {
                    Actions.doControlSelected(control);
                }

                Rectangle {
                    anchors {
                        fill: parent
                    }

                    color: getBackgroundColor(controlType)
                    border {
                        width: leafDataColumn.isSelected ? 2 : 0
                        color: "#000000"
                    }
                }

                Label {
                    anchors {
                        fill: parent
                    }

                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5

                    text: uniqueId
                }
            }

            Column {
                id: kidLeavesColumn

                x: 10
                width: parent.width - x
                spacing: parent.spacing

                Repeater {
                    model: modelData.kids
                    delegate: leafComponent
                }
            }
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            switch (type) {
                case Actions.controlSelected:
                    priv.selectedControl = message.control;
                    break;
                case Actions.modelUpdated:
                    priv.model = message.model;
                    break;
            }
        }
    }

    function getBackgroundColor(controlType) {
        if (ControlType.isParticleSystem(controlType)) {
            return Settings.particleSystemColor;
        }
        if (ControlType.isEmitter(controlType)) {
            return Settings.emitterColor;
        }
        if (ControlType.isParticle(controlType)) {
            return Settings.particleColor;
        }
        if (ControlType.isAffector(controlType)) {
            return Settings.affectorColor;
        }
        return "#FFFFFF";
    }
}
