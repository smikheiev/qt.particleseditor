import Qt.labs.platform 1.0
import QtQuick 2.9

import QuickFlux 1.0

import PE.Actions 1.0

Item {
    id: saveFileDialog

    FileDialog {
        id: fileDialog

        title: "Choose file to save"
        nameFilters: "*.json"
        fileMode: FileDialog.SaveFile

        onAccepted: {
            Actions.doFileToSaveChosen(file);
        }
    }

    Connections {
        target: AppDispatcher
        onDispatched: {
            if (type === Actions.chooseFileToSave) {
                fileDialog.open();
            }
        }
    }
}
