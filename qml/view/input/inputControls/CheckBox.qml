import QtQuick.Controls 2.2
import QtQuick 2.9

CheckBox {
    id: checkBox

    Binding {
        id: binding

        value: checkBox.checked
    }

    function bind(target, targetProperty) {
        checkBox.checked = target[targetProperty];

        binding.property = targetProperty;
        binding.target = target;
    }
}
