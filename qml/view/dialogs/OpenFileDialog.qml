import Qt.labs.platform 1.0
import QtQuick 2.9

import QuickFlux 1.0

import PE.Actions 1.0

Item {
    id: openFileDialog

    FileDialog {
        id: fileDialog

        title: "Choose file to open"
        nameFilters: "*.json"
        fileMode: FileDialog.OpenFile

        onAccepted: {
            Actions.doFileToOpenChosen(file);
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            if (type === Actions.chooseFileToOpen) {
                fileDialog.open();
            }
        }
    }
}
