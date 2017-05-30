import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick 2.9

import PE.Settings 1.0

import "controlSettings"
import "controlsTree"
import "mainMenu"
import "dialogs"
import "scene"

Item {
    id: windowContent

    readonly property MenuBar mainMenu: mainMenuWrapper.menu

    MainMenuWrapper {
        id: mainMenuWrapper
    }

    SplitView {
        id: contentSplitView

        anchors {
            fill: parent
        }

        SceneArea {
            id: sceneArea

            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ControlsTree {
            id: controlsTree

            width: Settings.controlsTreeWidth
            Layout.minimumWidth: 150
            Layout.fillHeight: true

            onWidthChanged: {
                Settings.controlsTreeWidth = width;
            }
        }

        ControlSettingsArea {
            id: controlSettingsArea

            width: Settings.settingsAreaWidth
            Layout.minimumWidth: 250
            Layout.fillHeight: true

            onWidthChanged: {
                Settings.settingsAreaWidth = width;
            }
        }
    }

    OpenFileDialog {}
    SaveFileDialog {}
    SettingsDialog {}
    QmlExportDialog {}
}
