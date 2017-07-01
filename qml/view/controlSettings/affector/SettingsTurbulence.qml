import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsTurbulence

    BaseSettingsFrame {
        InputRow {
            title: "Noise source"
            inputControlType: inputControlTypeImageSelector
            bindTarget: control
            bindTargetProperty: "noiseSource"
        }
        InputRow {
            title: "Strength"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "strength"
        }
    }
}
