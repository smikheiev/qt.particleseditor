import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsMaskShape

    InputRow {
        title: "Source"
        inputControlType: inputControlTypeImageSelector
        bindTarget: control
        bindTargetProperty: "source"
    }
}
