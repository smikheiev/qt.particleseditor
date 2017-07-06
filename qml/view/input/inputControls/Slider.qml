import QtQuick.Controls 2.2
import QtQuick 2.9

import "helpers"

Slider {
    id: slider

    readonly property BindingHelper bindingHelper: BindingHelper {}
    readonly property string valueProperty: "value"

    property int valueTextPrecision: 2

    snapMode: Slider.SnapAlways

    Text {
        id: fromText

        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 8
        }

        font.pointSize: 7
        text: slider.from.toFixed(valueTextPrecision)
    }

    Text {
        id: valueText

        anchors {
            centerIn: parent
        }

        font.pointSize: 8
        text: slider.value.toFixed(valueTextPrecision)
    }

    Text {
        id: toText

        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 8
        }

        font.pointSize: 7
        text: slider.to.toFixed(valueTextPrecision)
    }
}
