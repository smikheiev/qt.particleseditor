import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsTargetDirection

    InputRow {
        title: "Magnitude min"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitudeMin"
    }
    InputRow {
        title: "Magnitude max"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitudeMax"
    }

    InputRow {
        title: "Proportional magnitude"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "proportionalMagnitude"
    }

    InputRow {
        title: "Target x"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "targetX"
    }
    InputRow {
        title: "Target y"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "targetY"
    }
    InputRow {
        title: "Target variation"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "targetVariation"
    }
}
