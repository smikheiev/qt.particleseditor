import QtQuick 2.9

import PE.ControlType 1.0

import "../../input"
import "../direction"
import "../base"

BaseVisualControlSettings {
    id: baseEmitterSettings

    BaseSettingsFrame {
        InputRow {
            title: "Enabled"
            inputControlType: inputControlTypeCheckBox
            bindTarget: control
            bindTargetProperty: "enabled"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Group"
            inputControlType: inputControlTypeTextField
            bindTarget: control
            bindTargetProperty: "group"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Emit rate"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 300)
            bindTarget: control
            bindTargetProperty: "emitRate"
        }
        InputRow {
            title: "Maximum emitted"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-1, 1000)
            bindTarget: control
            bindTargetProperty: "maximumEmitted"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Start time"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 10000)
            bindTarget: control
            bindTargetProperty: "startTime"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Life span"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 5000)
            bindTarget: control
            bindTargetProperty: "lifeSpan"
        }
        InputRow {
            title: "Life span variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 5000)
            bindTarget: control
            bindTargetProperty: "lifeSpanVariation"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Size"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "size"
        }
        InputRow {
            title: "Size variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "sizeVariation"
        }
        InputRow {
            title: "End size"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-1, 1000)
            bindTarget: control
            bindTargetProperty: "endSize"
        }
    }

    BaseSettingsFrame {
        InputRow {
            id: velocitySettingsRow

            title: "Velocity"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "None", "value": "" },
                    { "text": "Angle direction", "value": ControlType.angleDirection },
                    { "text": "Point direction", "value": ControlType.pointDirection },
                    { "text": "Target direction", "value": ControlType.targetDirection },
                ],
                "onActivatedHandler": onActivatedHandler
            }

            Connections {
                target: control ? control.velocityHelper : null
                onValueTypeChanged: {
                    velocitySettingsRow.setVelocityTypeComboBox();
                }
            }

            function onActivatedHandler() {
                if (inputControl.value !== control.velocityHelper.valueType) {
                    control.velocityHelper.setValueOfType(inputControl.value);
                }
            }

            function setVelocityTypeComboBox() {
                if (control.velocityHelper.hasDefaultValue) {
                    inputControl.currentIndex = 0;
                } else {
                    inputControl.setCurrentIndex(control.velocityHelper.valueType);
                }
            }

            Component.onCompleted: {
                setVelocityTypeComboBox();
            }
        }
        SettingsAngleDirection {
            property bool isItemVelocityAngle: settingsEmitter.control && settingsEmitter.control.velocityHelper.valueType === ControlType.angleDirection

            x: 10
            width: parent.width - x

            visible: isItemVelocityAngle
            control: isItemVelocityAngle ? settingsEmitter.control.velocity : null
        }
        SettingsPointDirection {
            property bool isItemVelocityPoint: settingsEmitter.control && settingsEmitter.control.velocityHelper.valueType === ControlType.pointDirection

            x: 10
            width: parent.width - x

            visible: isItemVelocityPoint
            control: isItemVelocityPoint ? settingsEmitter.control.velocity : null
        }
        SettingsTargetDirection {
            property bool isItemVelocityTarget: settingsEmitter.control && settingsEmitter.control.velocityHelper.valueType === ControlType.targetDirection

            x: 10
            width: parent.width - x

            visible: isItemVelocityTarget
            control: isItemVelocityTarget ? settingsEmitter.control.velocity : null
        }

        InputRow {
            title: "Velocity from movement"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "velocityFromMovement"
        }
    }

    BaseSettingsFrame {
        InputRow {
            id: accelerationSettingsRow

            title: "Acceleration"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "None", "value": "" },
                    { "text": "Angle direction", "value": ControlType.angleDirection },
                    { "text": "Point direction", "value": ControlType.pointDirection },
                    { "text": "Target direction", "value": ControlType.targetDirection },
                ],
                "onActivatedHandler": onActivatedHandler
            }

            Connections {
                target: control ? control.accelerationHelper : null
                onValueTypeChanged: {
                    accelerationSettingsRow.setAccelerationTypeComboBox();
                }
            }

            function onActivatedHandler() {
                if (inputControl.value !== control.accelerationHelper.valueType) {
                    control.accelerationHelper.setValueOfType(inputControl.value);
                }
            }

            function setAccelerationTypeComboBox() {
                if (control.accelerationHelper.hasDefaultValue) {
                    inputControl.currentIndex = 0;
                } else {
                    inputControl.setCurrentIndex(control.accelerationHelper.valueType);
                }
            }

            Component.onCompleted: {
                setAccelerationTypeComboBox();
            }
        }
        SettingsAngleDirection {
            property bool isAccelerationAngle: settingsEmitter.control && settingsEmitter.control.accelerationHelper.valueType === ControlType.angleDirection

            x: 10
            width: parent.width - x

            visible: isAccelerationAngle
            control: isAccelerationAngle ? settingsEmitter.control.acceleration : null
        }
        SettingsPointDirection {
            property bool isAccelerationPoint: settingsEmitter.control && settingsEmitter.control.accelerationHelper.valueType === ControlType.pointDirection

            x: 10
            width: parent.width - x

            visible: isAccelerationPoint
            control: isAccelerationPoint ? settingsEmitter.control.acceleration : null
        }
        SettingsTargetDirection {
            property bool isAccelerationTarget: settingsEmitter.control && settingsEmitter.control.accelerationHelper.valueType === ControlType.targetDirection

            x: 10
            width: parent.width - x

            visible: isAccelerationTarget
            control: isAccelerationTarget ? settingsEmitter.control.acceleration : null
        }
    }
}
