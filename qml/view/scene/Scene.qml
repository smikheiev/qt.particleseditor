import QtQuick 2.9

import PE.Actions 1.0

Item {
    id: scene

    property int bgWidth: 400
    property int bgHeight: 400
    property color bgColor: "lightblue"
    property string bgSource: ""

    width: bgSource.length > 0 ? backgroundImage.width : backgroundRect.width
    height: bgSource.length > 0 ? backgroundImage.height : backgroundRect.height

    Image {
        id: backgroundImage

        source: bgSource

        onStatusChanged: {
            if (status === Image.Error) {
                scene.bgSource = ""
            }
        }
    }

    Rectangle {
        id: backgroundRect

        width: bgWidth
        height: bgHeight
        color: bgColor
        visible: bgSource.length === 0
    }

    MouseArea {
        anchors {
            fill: parent
        }

        onClicked: {
            Actions.doControlSelected(null);
        }
    }

    function serializeToJson() {
        var obj = {};
        obj.bgWidth = scene.bgWidth;
        obj.bgHeight = scene.bgHeight;
        obj.bgColor = "" + scene.bgColor;
        obj.bgSource = scene.bgSource;
        return obj;
    }

    function deserializeFromJson(obj) {
        scene.bgWidth = obj.bgWidth;
        scene.bgHeight = obj.bgHeight;
        scene.bgColor = obj.bgColor;
        scene.bgSource = obj.bgSource;
    }

    Component.onCompleted: {
        Actions.doSceneCreated(scene);
    }
}
