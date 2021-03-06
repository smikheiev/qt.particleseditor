import QtQuick.Particles 2.0
import QtQuick 2.9

import "../../input"
import "../base"

BaseControlSettings {
    id: settingsImageParticle

    BaseSettingsFrame {
        InputRow {
            title: "Source"
            inputControlType: inputControlTypeImageSelector
            bindTarget: control
            bindTargetProperty: "source"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Groups"
            inputControlType: inputControlTypeTextField
            inputControlProperties: {
                "onEditingFinishedHandler": onEditingFinishedHandler
            }

            function onEditingFinishedHandler() {
                control.groupsHelper.setGroupsFromText(inputControl.text);
            }

            Component.onCompleted: {
                inputControl.text = control.groupsHelper.getGroupsText();
            }
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Color"
            inputControlType: inputControlTypeColorSelector
            bindTarget: control
            bindTargetProperty: "color"
        }
        InputRow {
            title: "Color variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1, 0.01, 2)
            bindTarget: control
            bindTargetProperty: "colorVariation"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Alpha"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1, 0.01, 2)
            bindTarget: control
            bindTargetProperty: "alpha"
        }
        InputRow {
            title: "Alpha variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1, 0.01, 2)
            bindTarget: control
            bindTargetProperty: "alphaVariation"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Red variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1, 0.01, 2)
            bindTarget: control
            bindTargetProperty: "redVariation"
        }
        InputRow {
            title: "Green variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1, 0.01, 2)
            bindTarget: control
            bindTargetProperty: "greenVariation"
        }
        InputRow {
            title: "Blue variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1, 0.01, 2)
            bindTarget: control
            bindTargetProperty: "blueVariation"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Rotation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-360, 360)
            bindTarget: control
            bindTargetProperty: "rotation"
        }
        InputRow {
            title: "Rotation variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-360, 360)
            bindTarget: control
            bindTargetProperty: "rotationVariation"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Auto rotation"
            inputControlType: inputControlTypeCheckBox
            bindTarget: control
            bindTargetProperty: "autoRotation"
        }

        InputRow {
            title: "Rotation velocity"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(0, 1000)
            bindTarget: control
            bindTargetProperty: "rotationVelocity"
        }
        InputRow {
            title: "Rotation velocity variation"
            inputControlType: inputControlTypeSliderWithTextField
            inputControlProperties: getSliderProperties(-1000, 1000)
            bindTarget: control
            bindTargetProperty: "rotationVelocityVariation"
        }
    }

    BaseSettingsFrame {
        InputRow {
            title: "Entry effect"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "None", "value": ImageParticle.None },
                    { "text": "Fade", "value": ImageParticle.Fade },
                    { "text": "Scale", "value": ImageParticle.Scale },
                ]
            }
            bindTarget: control
            bindTargetProperty: "entryEffect"
        }
    }
}
