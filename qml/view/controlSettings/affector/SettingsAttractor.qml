import QtQuick.Particles 2.0
import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsAttractor

    InputRow {
        id: affectedParameterSettingsRow

        title: "Affected parameter"
        inputControlType: inputControlTypeComboBox
        inputControlProperties: {
            "model": [
                { "text": "Position", "value": Attractor.Position },
                { "text": "Velocity", "value": Attractor.Velocity },
                { "text": "Acceleration", "value": Attractor.Acceleration },
            ],
            "onActivatedHandler": onActivatedHandler
        }

        Connections {
            target: control
            onAffectedParameterChanged: {
                affectedParameterSettingsRow.inputControl.setCurrentIndex(control.affectedParameter);
            }
        }

        function onActivatedHandler() {
            control.affectedParameter = inputControl.value;
        }

        Component.onCompleted: {
            affectedParameterSettingsRow.inputControl.setCurrentIndex(control.affectedParameter);
        }
    }

    InputRow {
        id: proportionalToDistanceSettingsRow

        title: "Proportional to distance"
        inputControlType: inputControlTypeComboBox
        inputControlProperties: {
            "model": [
                { "text": "Constant", "value": Attractor.Constant },
                { "text": "Linear", "value": Attractor.Linear },
                { "text": "InverseLinear", "value": Attractor.InverseLinear },
                { "text": "Quadratic", "value": Attractor.Quadratic },
                { "text": "InverseQuadratic", "value": Attractor.InverseQuadratic }
            ],
            "onActivatedHandler": onActivatedHandler
        }

        Connections {
            target: control
            onProportionalToDistanceChanged: {
                proportionalToDistanceSettingsRow.inputControl.setCurrentIndex(control.proportionalToDistance)
            }
        }

        function onActivatedHandler() {
            control.proportionalToDistance = inputControl.value;
        }

        Component.onCompleted: {
            proportionalToDistanceSettingsRow.inputControl.setCurrentIndex(control.proportionalToDistance);
        }
    }
}
