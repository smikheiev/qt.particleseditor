import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsLineShape

    InputRow {
        title: "Mirrored"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "mirrored"
    }
}
