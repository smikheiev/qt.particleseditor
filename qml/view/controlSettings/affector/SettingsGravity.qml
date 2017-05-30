import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsGravity

    InputRow {
        title: "Angle"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "angle"
    }
    InputRow {
        title: "Magnitude"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitude"
    }
}
