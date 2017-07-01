import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Emitter {
    id: emitter

    property string uniqueId: ""
    property string controlType: ControlType.emitter

    property int lifeSpanMin: 1000
    property int lifeSpanMax: 0

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: emitter
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }
    readonly property SubControlHelper velocityHelper: SubControlHelper {
        control: emitter
        propertyName: "velocity"
        compareValueTypeFunction: function(valueType) { return ControlType.isDirection(valueType); }
    }
    readonly property SubControlHelper accelerationHelper: SubControlHelper {
        control: emitter
        propertyName: "acceleration"
        compareValueTypeFunction: function(valueType) { return ControlType.isDirection(valueType); }
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: emitter
        props: [
            {
                "prop": "shape",
                "serializeToJsonFunc": shapeHelper.serializeToJson,
                "deserializeFromJsonFunc": shapeHelper.deserializeFromJson,
                "serializeToQmlFunc": shapeHelper.serializeToQml,
            },
        ]
    }

    readonly property VariationHelper lifespanVariationHelper: VariationHelper {
        control: emitter
        minValueProperty: "lifeSpanMin"
        maxValueProperty: "lifeSpanMax"
    }

    width: 100
    height: 100

    lifeSpan: lifespanVariationHelper.baseValue()
    lifeSpanVariation: lifespanVariationHelper.variationValue()

    FrameHelper {
        control: emitter
    }
}
