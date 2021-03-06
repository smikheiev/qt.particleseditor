import QtQuick 2.9

import PE.ControlType 1.0

import "../../input"
import "../shape"

BaseVisualControlSettings {
    id: baseAffectorSettings

    BaseSettingsFrame {
        InputRow {
            title: "Enabled"
            inputControlType: inputControlTypeCheckBox
            bindTarget: control
            bindTargetProperty: "enabled"
        }

        InputRow {
            title: "Once"
            inputControlType: inputControlTypeCheckBox
            bindTarget: control
            bindTargetProperty: "once"
        }
    }
    BaseSettingsFrame {
        InputRow {
            title: "Groups"
            inputControlType: inputControlTypeTextField
            inputControlProperties: {
                "onEditingFinishedHandler": onEditingFinishedHandler
            }

            function onEditingFinishedHandler() {
                control.groupsHelper.setGroupsFromText(inputControl.text);
            }

            Component.onCompleted: {
                inputControl.text = control.groupsHelper.getGroupsText();
            }
        }
    }
    BaseSettingsFrame {
        InputRow {
            title: "Shape"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [ "None", ControlType.ellipseShape, ControlType.lineShape, ControlType.maskShape],
                "model": [
                    { "text": "None", "value": "" },
                    { "text": "Ellipse shape", "value": ControlType.ellipseShape },
                    { "text": "Line shape", "value": ControlType.lineShape },
                    { "text": "Mask shape", "value": ControlType.maskShape },
                ]
            }
            bindTarget: control ? control.shapeHelper : null
            bindTargetProperty: "valueType"
            bindTargetPropertyWrite: "newValueType"
        }
        SettingsEllipseShape {
            property bool isShapeEllipse: baseAffectorSettings.control && baseAffectorSettings.control.shapeHelper.valueType === ControlType.ellipseShape

            x: 10
            width: parent.width - x

            visible: isShapeEllipse
            control: isShapeEllipse ? baseAffectorSettings.control.shape : null
        }
        SettingsLineShape {
            property bool isShapeLine: baseAffectorSettings.control && baseAffectorSettings.control.shapeHelper.valueType === ControlType.lineShape

            x: 10
            width: parent.width - x

            visible: isShapeLine
            control: isShapeLine ? baseAffectorSettings.control.shape : null
        }
        SettingsMaskShape {
            property bool isShapeMask: baseAffectorSettings.control && baseAffectorSettings.control.shapeHelper.valueType === ControlType.maskShape

            x: 10
            width: parent.width - x

            visible: isShapeMask
            control: isShapeMask ? baseAffectorSettings.control.shape : null
        }
    }
}
