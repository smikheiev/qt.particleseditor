import QtQuick 2.9

import QuickFlux 1.0

import PE.Actions 1.0

import "../../input"

BaseSettings {
    id: baseControlSettings

    readonly property RegExpValidator uniqueIdValidator: RegExpValidator { regExp: /[a-z][a-zA-Z\d_]*/ }

    BaseSettingsFrame {
        InputRow {
            title: "Type"
            inputControlType: inputControlTypeTextField
            inputControlProperties: {
                "text": controlType,
                "readOnly": true
            }
        }

        InputRow {
            id: uniqueIdSettingRow

            title: "id"
            inputControlType: inputControlTypeTextField
            inputControlProperties: {
                "validator": uniqueIdValidator,
                "onEditingFinishedHandler": onEditingFinishedHandler,
                "autoBindTextChanges": false
            }
            bindTarget: control
            bindTargetProperty: "uniqueId"

            Connections {
                target: AppDispatcher
                onDispatched: {
                    if (type === Actions.changeControlIdError) {
                        if (control === message.control) {
                            uniqueIdSettingRow.inputControl.animateError()
                            uniqueIdSettingRow.inputControl.text = control.uniqueId;
                        }
                    }
                }
            }

            function onEditingFinishedHandler() {
                if (control.uniqueId !== inputControl.text) {
                    Actions.doChangeControlId(control, inputControl.text)
                }
            }
        }
    }
}
