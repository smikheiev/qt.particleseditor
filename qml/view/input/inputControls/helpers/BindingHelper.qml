import QtQuick 2.9

Item {
    id: bindingHelper

    property bool enableInputChangesTargetBinding: true
    property bool enableTargetChangesInputBinding: true

    // This binding is to change target property when input value is changed
    Binding {
        id: inputChangesTargetBinding

        when: enableInputChangesTargetBinding
    }

    // This binding is to change input value when target property is changed
    Binding {
        id: targetChangesInputBinding

        when: enableTargetChangesInputBinding
    }

    function bind(inputControl, inputControlPropertyRead, inputControlPropertyWrite, targetControl, targetControlPropertyRead, targetControlPropertyWrite) {
        if (!inputControlPropertyWrite) {
            inputControlPropertyWrite = inputControlPropertyRead;
        }

        if (!targetControlPropertyWrite) {
            targetControlPropertyWrite = targetControlPropertyRead;
        }

        inputControl[inputControlPropertyWrite] = targetControl[targetControlPropertyRead];

        inputChangesTargetBinding.property = targetControlPropertyWrite;
        inputChangesTargetBinding.target = targetControl;
        inputChangesTargetBinding.value = Qt.binding(function() { return inputControl[inputControlPropertyRead]; });

        targetChangesInputBinding.property = inputControlPropertyWrite;
        targetChangesInputBinding.target = inputControl;
        targetChangesInputBinding.value = Qt.binding(function() { return targetControl[targetControlPropertyRead]; });
    }
}
