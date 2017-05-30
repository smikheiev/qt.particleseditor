import QtQuick.Controls 2.2
import QtQuick 2.9

TextField {
    id: textField

    property var onEditingFinishedHandler: function() {}
    onEditingFinished: onEditingFinishedHandler()

    Rectangle {
        id: errorRect

        anchors {
            fill: parent
        }

        color: "red"
        opacity: 0.0
    }

    SequentialAnimation {
        id: errorAnimation

        NumberAnimation {
            target: errorRect
            property: "opacity"
            duration: 300
            from: 0.0
            to: 0.5
        }
        NumberAnimation {
            target: errorRect
            property: "opacity"
            duration: 200
            from: 0.5
            to: 0.0
        }
    }

    Binding {
        id: binding

        value: textField.text
    }

    function bind(target, targetProperty) {
        textField.text = target[targetProperty];

        binding.property = targetProperty;
        binding.target = target;
    }

    function animateError() {
        errorAnimation.restart();
    }
}
