import QtQuick 2.9

import QuickFlux 1.0

import PE.Actions 1.0

Item {
    id: mainMenuWrapper

    readonly property var menu: MainMenu {}

    Connections {
        target: AppDispatcher
        onDispatched: {
            if (type === Actions.controlSelected) {
                menu.isAnyControlSelected = (message.control !== null);
            }
        }
    }
}
