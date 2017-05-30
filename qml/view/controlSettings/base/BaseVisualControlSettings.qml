import QtQuick 2.9

import "../../input"

BaseControlSettings {
    id: baseVisualControlSettings

    InputRow {
        title: "Width"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(1, 1000)
        bindTarget: control
        bindTargetProperty: "width"
    }
    InputRow {
        title: "Height"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(1, 1000)
        bindTarget: control
        bindTargetProperty: "height"
    }

    InputRow {
        id: xSettingsRow

        title: "X"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-100, 1000)
        bindTarget: control
        bindTargetProperty: "x"

        Connections {
            target: control
            onXChanged: {
                xSettingsRow.inputControl.value = control.x;
            }
        }

        Component.onCompleted: {
            xSettingsRow.inputControl.value = control.x
        }
    }
    InputRow {
        id: ySettingsRow

        title: "Y"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-100, 1000)
        bindTarget: control
        bindTargetProperty: "y"

        Connections {
            target: control
            onYChanged: {
                ySettingsRow.inputControl.value = control.y;
            }
        }

        Component.onCompleted: {
            ySettingsRow.inputControl.value = control.y
        }
    }
}
