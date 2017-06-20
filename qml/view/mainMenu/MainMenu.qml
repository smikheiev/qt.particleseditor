import QtQuick.Controls 1.4

import PE.ControlType 1.0
import PE.Actions 1.0

MenuBar {
    id: mainMenu

    property bool isAnyControlSelected: false

    Menu {
        title: "File"

        MenuItem {
            text: "Save..."
            shortcut: "Ctrl+S"
            onTriggered: Actions.doChooseFileToSave()
        }
        MenuSeparator {}
        MenuItem {
            text: "Open..."
            shortcut: "Ctrl+O"
            onTriggered: Actions.doChooseFileToOpen()
        }
        MenuSeparator {}
        MenuItem {
            text: "Test..."
            shortcut: "Ctrl+T"
            onTriggered: Actions.doTestDialogNeeded()
        }
        MenuSeparator {}
        MenuItem {
            text: "Settings..."
            shortcut: "Ctrl+P"
            onTriggered: Actions.doOpenSettingsDialog()
        }
    }

    Menu {
        title: "Add control"

        MenuItemAddControl {
            text: "Particle system"
            controlType: ControlType.particleSystem
        }
        MenuSeparator {}
        MenuItemAddControl {
            text: "Emitter"
            controlType: ControlType.emitter
            enabled: isAnyControlSelected
        }
        MenuItemAddControl {
            text: "TrailEmitter"
            controlType: ControlType.trailEmitter
        }
        MenuSeparator {}
        MenuItemAddControl {
            text: "Image particle"
            controlType: ControlType.imageParticle
            enabled: isAnyControlSelected
        }
        MenuSeparator {}
        MenuItemAddControl {
            text: "Age"
            controlType: ControlType.age
            enabled: isAnyControlSelected
        }
        MenuItemAddControl {
            text: "Attractor"
            controlType: ControlType.attractor
            enabled: isAnyControlSelected
        }
        MenuItemAddControl {
            text: "Friction"
            controlType: ControlType.friction
            enabled: isAnyControlSelected
        }
        MenuItemAddControl {
            text: "Gravity"
            controlType: ControlType.gravity
            enabled: isAnyControlSelected
        }
        MenuItemAddControl {
            text: "Turbulence"
            controlType: ControlType.turbulence
            enabled: isAnyControlSelected
        }
        MenuItemAddControl {
            text: "Wander"
            controlType: ControlType.wander
            enabled: isAnyControlSelected
        }
    }

    Menu {
        title: "Delete"

        MenuItem {
            text: "Remove selected control"
            enabled: isAnyControlSelected
            shortcut: "Del"
            onTriggered: Actions.doRemoveSelectedControl()
        }
        MenuItem {
            text: "Remove all controls"
            shortcut: "Ctrl+Del"
            onTriggered: Actions.doRemoveAllControls()
        }
    }
}
