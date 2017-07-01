import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsFriction

    BaseSettingsFrame {
        InputRow {
            title: "Factor"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "factor"
        }
        InputRow {
            title: "Threshold"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "threshold"
        }
    }
}
