import QtQuick.Controls 2.2
import QtQuick 2.9

import "helpers"

TextField {
    id: textField

    readonly property BindingHelper bindingHelper: BindingHelper {
        enableInputChangesTargetBinding: textField.autoBindTextChanges
    }
    readonly property string valueProperty: "text"

    property bool autoBindTextChanges: true

    property var onEditingFinishedHandler: function() {}
    onEditingFinished: onEditingFinishedHandler()

    selectByMouse: true

    Rectangle {
        id: errorRect

        anchors {
            fill: parent
        }

        color: "red"
        opacity: 0.0
    }

    SequentialAnimation {
        id: errorAnimation

        NumberAnimation {
            target: errorRect
            property: "opacity"
            duration: 300
            from: 0.0
            to: 0.5
        }
        NumberAnimation {
            target: errorRect
            property: "opacity"
            duration: 200
            from: 0.5
            to: 0.0
        }
    }

    function animateError() {
        errorAnimation.restart();
    }
}
