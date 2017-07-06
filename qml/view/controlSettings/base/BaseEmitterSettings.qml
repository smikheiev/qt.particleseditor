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
            title: "Life span min"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 5000)
            bindTarget: control
            bindTargetProperty: "lifeSpanMin"
        }
        InputRow {
            title: "Life span max"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 5000)
            bindTarget: control
            bindTargetProperty: "lifeSpanMax"
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
            title: "Velocity"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "None", "value": "" },
                    { "text": "Angle direction", "value": ControlType.angleDirection },
                    { "text": "Point direction", "value": ControlType.pointDirection },
                    { "text": "Target direction", "value": ControlType.targetDirection },
                ]
            }
            bindTarget: control ? control.velocityHelper : null
            bindTargetProperty: "valueType"
            bindTargetPropertyWrite: "newValueType"
        }
        SettingsAngleDirection {
            property bool isItemVelocityAngle: baseEmitterSettings.control && baseEmitterSettings.control.velocityHelper.valueType === ControlType.angleDirection

            x: 10
            width: parent.width - x

            visible: isItemVelocityAngle
            control: isItemVelocityAngle ? baseEmitterSettings.control.velocity : null
        }
        SettingsPointDirection {
            property bool isItemVelocityPoint: baseEmitterSettings.control && baseEmitterSettings.control.velocityHelper.valueType === ControlType.pointDirection

            x: 10
            width: parent.width - x

            visible: isItemVelocityPoint
            control: isItemVelocityPoint ? baseEmitterSettings.control.velocity : null
        }
        SettingsTargetDirection {
            property bool isItemVelocityTarget: baseEmitterSettings.control && baseEmitterSettings.control.velocityHelper.valueType === ControlType.targetDirection

            x: 10
            width: parent.width - x

            visible: isItemVelocityTarget
            control: isItemVelocityTarget ? baseEmitterSettings.control.velocity : null
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
            title: "Acceleration"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "None", "value": "" },
                    { "text": "Angle direction", "value": ControlType.angleDirection },
                    { "text": "Point direction", "value": ControlType.pointDirection },
                    { "text": "Target direction", "value": ControlType.targetDirection },
                ]
            }
            bindTarget: control ? control.accelerationHelper : null
            bindTargetProperty: "valueType"
            bindTargetPropertyWrite: "newValueType"
        }
        SettingsAngleDirection {
            property bool isAccelerationAngle: baseEmitterSettings.control && baseEmitterSettings.control.accelerationHelper.valueType === ControlType.angleDirection

            x: 10
            width: parent.width - x

            visible: isAccelerationAngle
            control: isAccelerationAngle ? baseEmitterSettings.control.acceleration : null
        }
        SettingsPointDirection {
            property bool isAccelerationPoint: baseEmitterSettings.control && baseEmitterSettings.control.accelerationHelper.valueType === ControlType.pointDirection

            x: 10
            width: parent.width - x

            visible: isAccelerationPoint
            control: isAccelerationPoint ? baseEmitterSettings.control.acceleration : null
        }
        SettingsTargetDirection {
            property bool isAccelerationTarget: baseEmitterSettings.control && baseEmitterSettings.control.accelerationHelper.valueType === ControlType.targetDirection

            x: 10
            width: parent.width - x

            visible: isAccelerationTarget
            control: isAccelerationTarget ? baseEmitterSettings.control.acceleration : null
        }
    }
}
