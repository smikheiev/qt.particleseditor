import QtQuick.Controls 2.2
import QtQuick 2.9

Item {
    id: sceneArea

    Flickable {
        id: sceneContainer

        width: Math.min(parent.width, scene.width)
        height: Math.min(parent.height, scene.height)
        anchors {
            centerIn: parent
        }

        contentWidth: scene.width
        contentHeight: scene.height

        ScrollBar.vertical: ScrollBar {}
        ScrollBar.horizontal: ScrollBar {}

        clip: true

        Scene {
            id: scene

            anchors {
                centerIn: parent
            }
        }
    }
}
