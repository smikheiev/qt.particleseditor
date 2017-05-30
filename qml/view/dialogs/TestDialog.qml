import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.3
import QtQuick 2.9

import QuickFlux 1.0

import PE.Settings 1.0
import PE.Actions 1.0

Window {
    id: testDialog

    QtObject {
        id: priv

        property Item scene: null
        property QtObject testItem: null

        function createTestItem(qml) {
            var testItemQml = 'import QtQuick 2.9\n';
            testItemQml += 'import QtQuick.Particles 2.0\n';
            testItemQml += 'Item {\n';
            testItemQml += qml;
            testItemQml += '}';

            testItem = Qt.createQmlObject(testItemQml, testContainer);
        }
    }

    title: "Qt Particles Test"

    width: Settings.testDialogWidth
    height: Settings.testDialogHeight

    modality: Qt.WindowModal
    flags: Qt.Dialog

    onClosing: {
        if (priv.testItem) {
            priv.testItem.destroy();
        }
        qmlText.text = "";
    }

    RowLayout {
        anchors {
            fill: parent
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Flickable {
                width: Math.min(parent.width, testContainer.width)
                height: Math.min(parent.height, testContainer.height)
                anchors {
                    centerIn: parent
                }

                contentWidth: testContainer.width
                contentHeight: testContainer.height

                ScrollBar.vertical: ScrollBar {}
                ScrollBar.horizontal: ScrollBar {}

                clip: true

                Item {
                    id: testContainer

                    width: priv.scene.width
                    height: priv.scene.height

                    Image {
                        anchors {
                            fill: parent
                        }
                        source: priv.scene.bgSource
                        visible: priv.scene.bgSource.length > 0
                    }

                    Rectangle {
                        anchors {
                            fill: parent
                        }
                        color: priv.scene.bgColor
                        visible: priv.scene.bgSource.length === 0
                    }
                }
            }
        }

        Item {
            Layout.preferredWidth: 250
            Layout.fillHeight: true

            ColumnLayout {
                anchors {
                    fill: parent
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

                        clip: true
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
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            switch (type) {
                case Actions.sceneCreated:
                    priv.scene = message.scene;
                    break;
                case Actions.openTestDialog:
                    var qml = message.qml;
                    priv.createTestItem(qml);
                    qmlText.text = qml;
                    testDialog.show();
                    break;
            }
        }
    }
}
