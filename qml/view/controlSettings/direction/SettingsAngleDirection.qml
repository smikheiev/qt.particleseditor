import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsAngleDirection

    InputRow {
        title: "Angle"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "angle"
    }
    InputRow {
        title: "Angle variation"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "angleVariation"
    }

    InputRow {
        title: "Magnitude"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitude"
    }
    InputRow {
        title: "Magnitude variation"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "magnitudeVariation"
    }
}
