import QtQuick.Controls 2.2

ComboBox {
    id: comboBox

    property var onActivatedHandler: function() {}
    property var value: currentIndex < 0 ? undefined : model[currentIndex].value

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
