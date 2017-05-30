import QtQuick.Controls 2.2
import Qt.labs.platform 1.0
import QtQuick 2.9

MouseArea {
    id: imageSelector

    property string file: ""
    property string folder: ""

    QtObject {
        id: priv

        property bool isInClearMode: false
    }

    onClicked: {
        if (priv.isInClearMode) {
            priv.isInClearMode = false;
        } else {
            fileDialog.folder = folder;
            fileDialog.open();
        }
    }

    onPressAndHold: {
        priv.isInClearMode = true;
    }

    Rectangle {
        id: imageContainer

        width: height
        height: parent.height

        color: "lightgray"
        border.width: 1
        border.color: "#000000"

        Image {
            anchors {
                fill: parent
                margins: parent.border.width
            }

            source: imageSelector.file
        }

        Button {
            anchors {
                fill: parent
            }

            visible: priv.isInClearMode
            text: "X"

            onClicked: {
                imageSelector.file = "";
                priv.isInClearMode = false;
            }
        }
    }

    Label {
        id: fileNameLabel

        anchors {
            left: imageContainer.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 10
        }

        text: imageSelector.file.length > 0 ? imageSelector.file : "Click to choose image..."
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
    }

    FileDialog {
        id: fileDialog

        title: "Choose image"
        nameFilters: [ "*.png" ]
        fileMode: FileDialog.OpenFile

        onAccepted: {
            imageSelector.file = fileDialog.file;
            imageSelector.folder = fileDialog.folder;
        }
    }

    Binding {
        id: binding

        value: imageSelector.file
    }

    function bind(target, targetProperty) {
        imageSelector.file = target[targetProperty];

        binding.property = targetProperty;
        binding.target = target;
    }
}
