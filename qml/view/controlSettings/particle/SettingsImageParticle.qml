import QtQuick.Particles 2.0
import QtQuick 2.9

import "../../input"
import "../base"

BaseControlSettings {
    id: settingsImageParticle

    InputRow {
        title: "Source"
        inputControlType: inputControlTypeImageSelector
        bindTarget: control
        bindTargetProperty: "source"
    }

    InputRow {
        title: "Color"
        inputControlType: inputControlTypeColorSelector
        bindTarget: control
        bindTargetProperty: "color"
    }
    InputRow {
        title: "Color variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1)
        bindTarget: control
        bindTargetProperty: "colorVariation"
    }

    InputRow {
        title: "Alpha"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1)
        bindTarget: control
        bindTargetProperty: "alpha"
    }
    InputRow {
        title: "Alpha variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1)
        bindTarget: control
        bindTargetProperty: "alphaVariation"
    }

    InputRow {
        title: "Red variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1)
        bindTarget: control
        bindTargetProperty: "redVariation"
    }
    InputRow {
        title: "Green variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1)
        bindTarget: control
        bindTargetProperty: "greenVariation"
    }
    InputRow {
        title: "Blue variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1)
        bindTarget: control
        bindTargetProperty: "blueVariation"
    }

    InputRow {
        title: "Rotation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "rotation"
    }
    InputRow {
        title: "Rotation variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-360, 360)
        bindTarget: control
        bindTargetProperty: "rotationVariation"
    }

    InputRow {
        title: "Auto rotation"
        inputControlType: inputControlTypeCheckBox
        bindTarget: control
        bindTargetProperty: "autoRotation"
    }

    InputRow {
        title: "Rotation velocity"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(0, 1000)
        bindTarget: control
        bindTargetProperty: "rotationVelocity"
    }
    InputRow {
        title: "Rotation velocity variation"
        inputControlType: inputControlTypeSlider
        inputControlProperties: getSliderProperties(-1000, 1000)
        bindTarget: control
        bindTargetProperty: "rotationVelocityVariation"
    }

    InputRow {
        id: entryEffectSettingsRow

        title: "Entry effect"
        inputControlType: inputControlTypeComboBox
        inputControlProperties: {
            "model": [
                { "text": "None", "value": ImageParticle.None },
                { "text": "Fade", "value": ImageParticle.Fade },
                { "text": "Scale", "value": ImageParticle.Scale },
            ],
            "onActivatedHandler": onActivatedHandler
        }

        Connections {
            target: control
            onEntryEffectChanged: {
                entryEffectSettingsRow.inputControl.setCurrentIndex(control.entryEffect);
            }
        }

        function onActivatedHandler() {
            control.entryEffect = inputControl.value;
        }

        Component.onCompleted: {
            inputControl.setCurrentIndex(control.entryEffect);
        }
    }
}
