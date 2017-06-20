import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

TrailEmitter {
    id: trailEmitter

    property string uniqueId: ""
    property string controlType: ControlType.trailEmitter

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: trailEmitter
        propertyName: "emitShape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }
    readonly property SubControlHelper velocityHelper: SubControlHelper {
        control: trailEmitter
        propertyName: "velocity"
        compareValueTypeFunction: function(valueType) { return ControlType.isDirection(valueType); }
    }
    readonly property SubControlHelper accelerationHelper: SubControlHelper {
        control: trailEmitter
        propertyName: "acceleration"
        compareValueTypeFunction: function(valueType) { return ControlType.isDirection(valueType); }
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: trailEmitter
        props: [
            {
                "prop": "follow",
                "serializeToQmlFunc": function() { return "\"" + group + "\""; }
            },
            "emitRatePerParticle",
            {
                "prop": "emitShape",
                "serializeToJsonFunc": shapeHelper.serializeToJson,
                "deserializeFromJsonFunc": shapeHelper.deserializeFromJson,
                "serializeToQmlFunc": shapeHelper.serializeToQml,
            },
            "emitHeight",
            "emitWidth",
        ]
    }

    FrameHelper {
        control: trailEmitter
    }
}
