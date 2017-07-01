import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsGravity

    BaseSettingsFrame {
        InputRow {
            title: "Angle"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-360, 360)
            bindTarget: control
            bindTargetProperty: "angle"
        }
        InputRow {
            title: "Magnitude"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-1000, 1000)
            bindTarget: control
            bindTargetProperty: "magnitude"
        }
    }
}
