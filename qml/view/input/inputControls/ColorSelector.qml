import QtQuick.Controls 2.2
import Qt.labs.platform 1.0
import QtQuick 2.9

import "helpers"

MouseArea {
    id: colorSelector

    readonly property BindingHelper bindingHelper: BindingHelper {}
    readonly property string valueProperty: "color"

    property color color: "#000000"

    onClicked: {
        colorDialog.open();
        colorDialog.color = colorSelector.color;
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
            colorSelector.color = colorDialog.color
        }

        onRejected: {
            colorSelector.color = colorDialog.color
        }

        onCurrentColorChanged: {
            colorSelector.color = colorDialog.currentColor
        }
    }
}
