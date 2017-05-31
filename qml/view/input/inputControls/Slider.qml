import QtQuick.Controls 2.2
import QtQuick 2.9

import ".."

Slider {
    id: slider

    Text {
        id: fromText

        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 8
        }

        font.pointSize: 7
        text: slider.from.toFixed(0)
    }

    Text {
        id: valueText

        anchors {
            centerIn: parent
        }

        font.pointSize: 8
        text: slider.value.toFixed(2)
    }

    Text {
        id: toText

        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 8
        }

        font.pointSize: 7
        text: slider.to.toFixed(2)
    }

    Binding {
        id: binding

        value: slider.value
    }

    function bind(target, targetProperty) {
        slider.value = target[targetProperty];

        binding.property = targetProperty;
        binding.target = target;
    }
}