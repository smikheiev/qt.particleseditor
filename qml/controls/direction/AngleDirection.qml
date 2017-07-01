import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

AngleDirection {
    id: angleDirection

    property string uniqueId: ""
    property string controlType: ControlType.angleDirection

    property real angleMin: 0
    property real angleMax: 0

    property real magnitudeMin: 0
    property real magnitudeMax: 0

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: angleDirection
        props: [
            "angle",
            "angleVariation",
            "magnitude",
            "magnitudeVariation"
        ]
    }

    readonly property VariationHelper angleVariationHelper: VariationHelper {
        control: angleDirection
        minValueProperty: "angleMin"
        maxValueProperty: "angleMax"
    }

    readonly property VariationHelper magnitudeVariationHelper: VariationHelper {
        control: angleDirection
        minValueProperty: "magnitudeMin"
        maxValueProperty: "magnitudeMax"
    }

    angle: angleVariationHelper.baseValue()
    angleVariation: angleVariationHelper.variationValue()

    magnitude: magnitudeVariationHelper.baseValue()
    magnitudeVariation: magnitudeVariationHelper.variationValue()
}
