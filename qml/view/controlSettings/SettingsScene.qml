import QtQuick 2.9

import PE.Settings 1.0

import "../input"
import "base"

BaseSettings {
    id: settingsScene

    BaseSettingsFrame {
        InputRow {
            title: "Type"
            inputControlType: inputControlTypeTextField
            inputControlProperties: {
                "text": "Scene",
                "readOnly": true
            }
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Background image"
            inputControlType: inputControlTypeImageSelector
            bindTarget: control
            bindTargetProperty: "bgSource"
        }

        InputRow {
            title: "Show control frames"
            inputControlType: inputControlTypeCheckBox
            bindTarget: Settings
            bindTargetProperty: "showFrames"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Width"
            inputControlType: inputControlTypeSlider
            inputControlProperties: getSliderProperties(1, 1000)
            bindTarget: control
            bindTargetProperty: "bgWidth"
            visible: control.bgSource.length === 0
        }
        InputRow {
            title: "Height"
            inputControlType: inputControlTypeSlider
            inputControlProperties: getSliderProperties(1, 1000)
            bindTarget: control
            bindTargetProperty: "bgHeight"
            visible: control.bgSource.length === 0
        }
        InputRow {
            title: "Background color"
            inputControlType: inputControlTypeColorSelector
            bindTarget: control
            bindTargetProperty: "bgColor"
            visible: control.bgSource.length === 0
        }
    }
}
