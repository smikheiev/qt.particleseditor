import QtQuick 2.9

import PE.ControlType 1.0

import "../../input"
import "../shape"
import "../base"

BaseEmitterSettings {
    id: settingsEmitter

    BaseSettingsFrame {
        InputRow {
            title: "Emit width"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(1, 1000)
            bindTarget: control
            bindTargetProperty: "emitWidth"
        }
        InputRow {
            title: "Emit height"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(1, 1000)
            bindTarget: control
            bindTargetProperty: "emitHeight"
        }

        InputRow {
            id: shapeSettingsRow

            title: "Emit shape"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [ "None", ControlType.ellipseShape, ControlType.lineShape, ControlType.maskShape],
                "model": [
                    { "text": "None", "value": "" },
                    { "text": "Ellipse shape", "value": ControlType.ellipseShape },
                    { "text": "Line shape", "value": ControlType.lineShape },
                    { "text": "Mask shape", "value": ControlType.maskShape },
                ],
                "onActivatedHandler": onActivatedHandler
            }

            Connections {
                target: control ? control.shapeHelper : null
                onValueTypeChanged: {
                    shapeSettingsRow.setShapeTypeComboBox();
                }
            }

            function onActivatedHandler() {
                if (inputControl.value !== control.shapeHelper.valueType) {
                    control.shapeHelper.setValueOfType(inputControl.value);
                }
            }

            function setShapeTypeComboBox() {
                if (control.shapeHelper.hasDefaultValue) {
                    inputControl.currentIndex = 0;
                } else {
                    inputControl.setCurrentIndex(control.shapeHelper.valueType);
                }
            }

            Component.onCompleted: {
                setShapeTypeComboBox();
            }
        }
        SettingsEllipseShape {
            property bool isShapeEllipse: settingsEmitter.control && settingsEmitter.control.shapeHelper.valueType === ControlType.ellipseShape

            x: 10
            width: parent.width - x

            visible: isShapeEllipse
            control: isShapeEllipse ? settingsEmitter.control.shape : null
        }
        SettingsLineShape {
            property bool isShapeLine: settingsEmitter.control && settingsEmitter.control.shapeHelper.valueType === ControlType.lineShape

            x: 10
            width: parent.width - x

            visible: isShapeLine
            control: isShapeLine ? settingsEmitter.control.shape : null
        }
        SettingsMaskShape {
            property bool isShapeMask: settingsEmitter.control && settingsEmitter.control.shapeHelper.valueType === ControlType.maskShape

            x: 10
            width: parent.width - x

            visible: isShapeMask
            control: isShapeMask ? settingsEmitter.control.shape : null
        }
    }

    BaseSettingsFrame {
        InputRow {
            id: followSettingsRow

            title: "Follow"
            inputControlType: inputControlTypeTextField
            bindTarget: control
            bindTargetProperty: "follow"

            Connections {
                target: control
                onFollowChanged: {
                    if (followSettingsRow.inputControl.text !== control.follow) {
                        followSettingsRow.inputControl.text = control.follow;
                    }
                }
            }
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Emit rate per particle"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(1, 300)
            bindTarget: control
            bindTargetProperty: "emitRatePerParticle"
        }
    }
}
