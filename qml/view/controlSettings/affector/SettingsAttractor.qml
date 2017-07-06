import QtQuick.Particles 2.0
import QtQuick 2.9

import "../../input"
import "../base"

BaseAffectorSettings {
    id: settingsAttractor

    BaseSettingsFrame {
        InputRow {
            title: "Affected parameter"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "Position", "value": Attractor.Position },
                    { "text": "Velocity", "value": Attractor.Velocity },
                    { "text": "Acceleration", "value": Attractor.Acceleration },
                ]
            }
            bindTarget: control
            bindTargetProperty: "affectedParameter"
        }

        InputRow {
            title: "Proportional to distance"
            inputControlType: inputControlTypeComboBox
            inputControlProperties: {
                "model": [
                    { "text": "Constant", "value": Attractor.Constant },
                    { "text": "Linear", "value": Attractor.Linear },
                    { "text": "InverseLinear", "value": Attractor.InverseLinear },
                    { "text": "Quadratic", "value": Attractor.Quadratic },
                    { "text": "InverseQuadratic", "value": Attractor.InverseQuadratic }
                ]
            }
            bindTarget: control
            bindTargetProperty: "proportionalToDistance"
        }
    }
}
