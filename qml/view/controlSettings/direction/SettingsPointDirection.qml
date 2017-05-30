import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsPointDirection

    InputRow {
        title: "X"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "x"
    }
    InputRow {
        title: "X variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "xVariation"
    }

    InputRow {
        title: "Y"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "y"
    }
    InputRow {
        title: "Y variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "yVariation"
    }
}
