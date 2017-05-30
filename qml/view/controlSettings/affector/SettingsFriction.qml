import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsFriction

    InputRow {
        title: "Factor"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1000)
        bindTarget: control
        bindTargetProperty: "factor"
    }
    InputRow {
        title: "Threshold"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1000)
        bindTarget: control
        bindTargetProperty: "threshold"
    }
}
