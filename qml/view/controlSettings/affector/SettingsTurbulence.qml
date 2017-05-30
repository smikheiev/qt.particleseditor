import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsTurbulence

    InputRow {
        title: "Noise source"
        inputControlType: inputControlTypeImageSelector
        bindTarget: control
        bindTargetProperty: "noiseSource"
    }
    InputRow {
        title: "Strength"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1000)
        bindTarget: control
        bindTargetProperty: "strength"
    }
}
