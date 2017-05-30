import QtQuick 2.9

import "../input"
import "base"

BaseControlSettings {
    id: settingsParticleSystem

    InputRow {
        title: "Paused"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "paused"
    }

    InputRow {
        title: "Running"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "running"
    }
}
