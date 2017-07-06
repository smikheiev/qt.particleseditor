import QtQuick.Particles 2.0
import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsWander

    BaseSettingsFrame {
        InputRow {
            title: "Affected parameter"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "Position", "value": Wander.Position },
                    { "text": "Velocity", "value": Wander.Velocity },
                    { "text": "Acceleration",  "value": Wander.Acceleration }
                ]
            }
            bindTarget: control
            bindTargetProperty: "affectedParameter"
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
