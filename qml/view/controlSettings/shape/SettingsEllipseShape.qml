import QtQuick 2.9

import "../../input"
import "../base"

BaseSettings {
    id: settingsEllipseShape

    InputRow {
        title: "Fill"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "fill"
    }
}
