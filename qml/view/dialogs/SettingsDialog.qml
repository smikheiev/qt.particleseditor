import QtQuick.Window 2.3
import QtQuick 2.9

import QuickFlux 1.0

import PE.Settings 1.0
import PE.Actions 1.0

import "../controlSettings/base"
import "../input"

Window {
    id: settingsDialog

    title: "Settings"

    width: 300
    height: settingsRowsColumn.height + 20

    modality: Qt.WindowModal
    flags: Qt.Dialog

    Column {
        id: settingsRowsColumn

        width: parent.width - 20
        anchors {
            centerIn: parent
        }

        spacing: 2

        InputRow {
            title: "Show control frames"
            inputControlType: inputControlTypeCheckBox
            bindTarget: Settings
            bindTargetProperty: "showFrames"
        }

        InputRow {
            title: "Particle system frame color"
            inputControlType: inputControlTypeColorSelector
            bindTarget: Settings
            bindTargetProperty: "particleSystemColor"
        }
        InputRow {
            title: "Emitter frame color"
            inputControlType: inputControlTypeColorSelector
            bindTarget: Settings
            bindTargetProperty: "emitterColor"
        }
        InputRow {
            title: "Particle frame color"
            inputControlType: inputControlTypeColorSelector
            bindTarget: Settings
            bindTargetProperty: "particleColor"
        }
        InputRow {
            title: "Affector frame color"
            inputControlType: inputControlTypeColorSelector
            bindTarget: Settings
            bindTargetProperty: "affectorColor"
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            if (type === Actions.openSettingsDialog) {
                settingsDialog.show();
            }
        }
    }
}
