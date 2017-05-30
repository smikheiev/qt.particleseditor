pragma Singleton

import Qt.labs.settings 1.0 as QtSettings

import PE.Common 1.0

QtObjectWithKids {
    id: settings

    // layout
    property int windowX: 0
    property int windowY: 0
    property int windowWidth: 800
    property int windowHeight: 600
    property int settingsAreaWidth: 250
    property int controlsTreeWidth: 150
    property int testDialogWidth: 700
    property int testDialogHeight: 500

    // controls
    property bool showFrames: true
    property color particleSystemColor: "#FFFF00"
    property color emitterColor: "#0000FF"
    property color particleColor: "#00FF00"
    property color affectorColor: "#FF0000"

    QtSettings.Settings {
        category: "layout"

        property alias windowX: settings.windowX
        property alias windowY: settings.windowY
        property alias windowWidth: settings.windowWidth
        property alias windowHeight: settings.windowHeight
        property alias settingsAreaWidth: settings.settingsAreaWidth
        property alias controlsTreeWidth: settings.controlsTreeWidth
        property alias testDialogWidth: settings.testDialogWidth
        property alias testDialogHeight: settings.testDialogHeight
    }

    QtSettings.Settings {
        category: "controls"

        property alias showFrames: settings.showFrames
        property alias particleSystemColor: settings.particleSystemColor
        property alias emitterColor: settings.emitterColor
        property alias particleColor: settings.particleColor
        property alias affectorColor: settings.affectorColor
    }
}
