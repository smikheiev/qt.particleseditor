import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsTargetDirection

    InputRow {
        title: "Magnitude"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitude"
    }
    InputRow {
        title: "Magnitude variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitudeVariation"
    }

    InputRow {
        title: "Proportional magnitude"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "proportionalMagnitude"
    }

    InputRow {
        title: "Target x"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "targetX"
    }
    InputRow {
        title: "Target y"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "targetY"
    }
    InputRow {
        title: "Target variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "targetVariation"
    }
}
