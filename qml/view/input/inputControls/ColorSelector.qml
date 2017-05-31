import QtQuick.Controls 2.2
import Qt.labs.platform 1.0
import QtQuick 2.9

MouseArea {
    id: colorSelector

    property color color: "#000000"

    onClicked: {
        colorDialog.open();
        colorDialog.currentColor = colorSelector.color;
    }

    Rectangle {
        id: colorRect

        width: height
        height: parent.height

        color: colorSelector.color
        border.width: 1
        border.color: "#000000"
    }

    Label {
        id: colorNameLabel

        anchors {
            left: colorRect.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 10
        }

        text: colorSelector.color
        verticalAlignment: Text.AlignVCenter
    }

    ColorDialog {
        id: colorDialog

        title: "Choose a color"

        onAccepted: {
            colorSelector.color = currentColor
        }
    }

    Binding {
        id: binding

        value: colorSelector.color
    }

    function bind(target, targetProperty) {
        colorSelector.color = target[targetProperty];

        binding.property = targetProperty;
        binding.target = target;
    }
}