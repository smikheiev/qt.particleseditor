import QtQuick 2.9

import "../../input"

BaseControlSettings {
    id: baseVisualControlSettings

    BaseSettingsFrame {
        InputRow {
            title: "Width"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(1, 1000)
            bindTarget: control
            bindTargetProperty: "width"
        }
        InputRow {
            title: "Height"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(1, 1000)
            bindTarget: control
            bindTargetProperty: "height"
        }

        InputRow {
            title: "X"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-100, 1000)
            bindTarget: control
            bindTargetProperty: "x"
        }
        InputRow {
            title: "Y"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-100, 1000)
            bindTarget: control
            bindTargetProperty: "y"
        }
    }
}
