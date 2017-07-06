import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

PointDirection {
    id: pointDirection

    property string uniqueId: ""
    property string controlType: ControlType.pointDirection

    property real xMin: 0
    property real xMax: 0

    property real yMin: 0
    property real yMax: 0

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: pointDirection
        props: [
            {
                "prop": "x",
                "ignore": "json"
            },
            {
                "prop": "xVariation",
                "ignore": "json"
            },
            {
                "prop": "y",
                "ignore": "json"
            },
            {
                "prop": "yVariation",
                "ignore": "json"
            },
            {
                "prop": "xMin",
                "ignore": "qml"
            },
            {
                "prop": "xMax",
                "ignore": "qml"
            },
            {
                "prop": "yMin",
                "ignore": "qml"
            },
            {
                "prop": "yMax",
                "ignore": "qml"
            },
        ]
    }

    readonly property VariationHelper xVariationHelper: VariationHelper {
        control: pointDirection
        minValueProperty: "xMin"
        maxValueProperty: "xMax"
    }

    readonly property VariationHelper yVariationHelper: VariationHelper {
        control: pointDirection
        minValueProperty: "yMin"
        maxValueProperty: "yMax"
    }

    x: xVariationHelper.baseValue()
    xVariation: xVariationHelper.variationValue()

    y: yVariationHelper.baseValue()
    yVariation: yVariationHelper.variationValue()
}
