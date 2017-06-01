import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "helpers"

Emitter {
    id: emitter

    property string uniqueId: ""
    property string controlType: ControlType.emitter

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
                "prop": "acceleration",
                "serializeToJsonFunc": accelerationHelper.serializeToJson,
                "deserializeFromJsonFunc": accelerationHelper.deserializeFromJson,
                "serializeToQmlFunc": accelerationHelper.serializeToQml,
            },
            "emitRate",
            "enabled",
            "endSize",
            {
                "prop": "group",
                "serializeToQmlFunc": function() { return "\"" + group + "\""; }
            },
            "lifeSpan",
            "lifeSpanVariation",
            "maximumEmitted",
            {
                "prop": "shape",
                "serializeToJsonFunc": shapeHelper.serializeToJson,
                "deserializeFromJsonFunc": shapeHelper.deserializeFromJson,
                "serializeToQmlFunc": shapeHelper.serializeToQml,
            },
            "size",
            "sizeVariation",
            "startTime",
            {
                "prop": "system",
                "ignore": "json",
                "serializeToQmlFunc": function() { return system.uniqueId; },
            },
            {
                "prop": "velocity",
                "serializeToJsonFunc": velocityHelper.serializeToJson,
                "deserializeFromJsonFunc": velocityHelper.deserializeFromJson,
                "serializeToQmlFunc": velocityHelper.serializeToQml,
            },
            "velocityFromMovement",
        ]
    }

    width: 100
    height: 100

    FrameHelper {
        control: emitter
    }
}
