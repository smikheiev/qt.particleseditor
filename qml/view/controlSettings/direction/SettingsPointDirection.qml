import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsPointDirection

    InputRow {
        title: "X min"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "xMin"
    }
    InputRow {
        title: "X max"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "xMax"
    }

    InputRow {
        title: "Y min"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "yMin"
    }
    InputRow {
        title: "Y max"
        inputControlType: inputControlTypeSliderWithTextField
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "yMax"
    }
}
