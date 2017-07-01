import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

TargetDirection {
    id: targetDirection

    property string uniqueId: ""
    property string controlType: ControlType.targetDirection

    property real magnitudeMin: 0
    property real magnitudeMax: 0

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

    readonly property VariationHelper magnitudeVariationHelper: VariationHelper {
        control: targetDirection
        minValueProperty: "magnitudeMin"
        maxValueProperty: "magnitudeMax"
    }

    magnitude: magnitudeVariationHelper.baseValue()
    magnitudeVariation: magnitudeVariationHelper.variationValue()
}
