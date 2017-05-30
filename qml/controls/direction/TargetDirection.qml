import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

TargetDirection {
    id: targetDirection

    property string uniqueId: ""
    property string controlType: ControlType.targetDirection

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: targetDirection
        props: [
            "magnitude",
            "magnitudeVariation",
            "proportionalMagnitude",
            "targetVariation",
            "targetX",
            "targetY",
        ]
    }
}
