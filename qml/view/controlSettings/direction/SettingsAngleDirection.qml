import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsAngleDirection

    InputRow {
        title: "Angle min"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "angleMin"
    }
    InputRow {
        title: "Angle max"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "angleMax"
    }

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
}
