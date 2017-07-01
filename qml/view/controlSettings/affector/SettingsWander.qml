import QtQuick.Particles 2.0
import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsWander

    BaseSettingsFrame {
        InputRow {
            id: affectedParameterSettingsRow

            title: "Affected parameter"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "Position", "value": Wander.Position },
                    { "text": "Velocity", "value": Wander.Velocity },
                    { "text": "Acceleration",  "value": Wander.Acceleration }
                ],
                "onActivatedHandler": onActivatedHandler
            }

            Connections {
                target: control
                onAffectedParameterChanged: {
                    affectedParameterSettingsRow.inputControl.setCurrentIndex(control.affectedParameter);
                }
            }

            function onActivatedHandler() {
                control.affectedParameter = inputControl.value;
            }

            Component.onCompleted: {
                affectedParameterSettingsRow.inputControl.setCurrentIndex(control.affectedParameter);
            }
        }

        InputRow {
            title: "Pace"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "pace"
        }

        InputRow {
            title: "X variance"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-1000, 1000)
            bindTarget: control
            bindTargetProperty: "xVariance"
        }
        InputRow {
            title: "Y variance"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-1000, 1000)
            bindTarget: control
            bindTargetProperty: "yVariance"
        }
    }
}
