import QtQuick.Controls 1.4

import PE.Settings 1.0

import "view"
import "logic"

ApplicationWindow {
    id: mainWindow

    title: "Qt Particles Editor"

    x: Settings.windowX
    y: Settings.windowY
    width: Settings.windowWidth
    height: Settings.windowHeight

    minimumWidth: 600
    minimumHeight: 600

    visible: true

    menuBar: windowContent.mainMenu

    onXChanged: Qt.callLater(updateSettings)
    onYChanged: Qt.callLater(updateSettings)
    onWidthChanged: Qt.callLater(updateSettings)
    onHeightChanged: Qt.callLater(updateSettings)

    WindowContent {
        id: windowContent

        anchors {
            fill: parent
        }
    }

    Logic {}

    function updateSettings() {
        if (visibility !== ApplicationWindow.Maximized) {
            Settings.windowX = x;
            Settings.windowY = y;
            Settings.windowWidth = width;
            Settings.windowHeight = height;
        }
    }
}
