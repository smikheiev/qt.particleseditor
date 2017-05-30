import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsAge

    InputRow {
        title: "Advance position"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "advancePosition"
    }

    InputRow {
        title: "Life left"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1000)
        bindTarget: control
        bindTargetProperty: "lifeLeft"
    }
}
