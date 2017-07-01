import QtQuick 2.9

import PE.ControlType 1.0
import PE.Settings 1.0
import PE.Actions 1.0

Item {
    id: scene

    readonly property Item controlsContainer: controlsContainer

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

    Item {
        id: controlsContainer

        anchors {
            fill: parent
        }
    }

    MouseArea {
        anchors {
            fill: parent
        }

        onPressed: {
            if (!Settings.showFrames) {
                Actions.doControlSelected(null);
                return;
            }

            var ofst = Settings.mouseBorderOffset; // Only for shorter var name

            var borderClickedControls = [];
            var clickedControls = [];
            var controlsToSelect = [];
            var i, length;
            for (i = controlsContainer.children.length - 1; i >= 0; --i) {
                var kid = controlsContainer.children[i];
                if (kid.hasOwnProperty("frameHelper")) {
                    var mouseKidPoint = kid.mapFromItem(scene, mouse.x, mouse.y);

                    var clickedInControl =
                            (mouseKidPoint.x >= -ofst && mouseKidPoint.y >= -ofst) &&
                            (mouseKidPoint.x <= kid.width + ofst && mouseKidPoint.y <= kid.height + ofst);

                    if (!clickedInControl) {
                        continue;
                    }

                    var clickedOnBorder =
                            (mouseKidPoint.x >= -ofst && mouseKidPoint.x <= ofst) ||
                            (mouseKidPoint.x >= kid.width - ofst && mouseKidPoint.x <= kid.width + ofst) ||
                            (mouseKidPoint.y >= -ofst && mouseKidPoint.y <= ofst) ||
                            (mouseKidPoint.y >= kid.height - ofst && mouseKidPoint.y <= kid.height + ofst)

                    if (clickedOnBorder) {
                        borderClickedControls.push(kid);
                    } else if (borderClickedControls.length === 0) {
                        clickedControls.push(kid);
                    }
                }
            }

            var controlsArray = borderClickedControls.length > 0 ? borderClickedControls : clickedControls;

            var resultControl = null;
            for (i in controlsArray) {
                var control = controlsArray[i];
                if (!resultControl || control.frameHelper.isSelected) {
                    resultControl = control;
                }
            }

            Actions.doControlSelected(resultControl);

            mouse.accepted = false;
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
