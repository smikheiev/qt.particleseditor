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
            {
                "prop": "angle",
                "ignore": "json"
            },
            {
                "prop": "angleVariation",
                "ignore": "json"
            },
            {
                "prop": "magnitude",
                "ignore": "json"
            },
            {
                "prop": "magnitudeVariation",
                "ignore": "json"
            },
            {
                "prop": "angleMin",
                "ignore": "qml"
            },
            {
                "prop": "angleMax",
                "ignore": "qml"
            },
            {
                "prop": "magnitudeMin",
                "ignore": "qml"
            },
            {
                "prop": "magnitudeMax",
                "ignore": "qml"
            },
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
