import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.3
import QtQuick 2.9

import QuickFlux 1.0

import PE.Actions 1.0

Window {
    id: qmlExportDialog

    title: "QML Export"

    width: 400
    height: 500

    modality: Qt.WindowModal
    flags: Qt.Dialog

    ColumnLayout {
        anchors {
            fill: parent
            margins: 5
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: "lightgray"

            Flickable {
                anchors {
                    fill: parent
                }

                TextArea.flickable: TextArea {
                    id: qmlText

                    readOnly: true
                    selectByMouse: true
                    selectByKeyboard: true
                }

                ScrollBar.vertical: ScrollBar {}
                ScrollBar.horizontal: ScrollBar {}
            }
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }

            text: "Copy all"

            onClicked: {
                qmlText.selectAll();
                qmlText.copy();
            }
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            if (type === Actions.openQmlExportDialog) {
                qmlText.text = message.qml;
                qmlExportDialog.show();
            }
        }
    }
}
