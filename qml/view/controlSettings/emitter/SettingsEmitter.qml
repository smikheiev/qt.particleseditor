import QtQuick.Controls 2.2
import QtQuick 2.9

import PE.ControlType 1.0

import "../../input"
import "../shape"
import "../base"

BaseEmitterSettings {
    id: settingsEmitter

    BaseSettingsFrame {
        InputRow {
            id: burstCountInputRow
            title: "Burst count"
            inputControlType: inputControlTypeSlider
            inputControlProperties: getSliderProperties(1, 300)
        }
        Button {
            width: parent.width
            text: "Burst"
            onClicked: {
                var count = burstCountInputRow.inputControl.value;
                control.burst(count);
            }
        }
    }

    BaseSettingsFrame {
        InputRow {
            id: pulseDurationInputRow
            title: "Pulse duration"
            inputControlType: inputControlTypeSlider
            inputControlProperties: getSliderProperties(0, 10000)
        }
        Button {
            width: parent.width
            text: "Pulse"
            onClicked: {
                var duration = pulseDurationInputRow.inputControl.value;
                control.pulse(duration);
            }
        }
    }

    BaseSettingsFrame {
        InputRow {
            id: shapeSettingsRow

            title: "Shape"
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
}
