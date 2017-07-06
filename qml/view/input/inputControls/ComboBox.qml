import QtQuick.Controls 2.2

import "helpers"

ComboBox {
    id: comboBox

    readonly property BindingHelper bindingHelper: BindingHelper {}
    readonly property string valueProperty: "value"
    readonly property string valuePropertyWrite: "newValue"

    readonly property var value: currentIndex < 0 ? undefined : model[currentIndex].value

    property var onActivatedHandler: function() {}

    property var newValue
    onNewValueChanged: {
        if (newValue !== value) {
            setCurrentIndex(newValue);
        }
    }

    onActivated: onActivatedHandler()

    textRole: "text"

    function setCurrentIndex(value) {
        for (var i in model) {
            if (model[i].value === value) {
                currentIndex = i;
            }
        }
    }
}
