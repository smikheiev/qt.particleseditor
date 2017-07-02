import QtQuick.Particles 2.0
import QtQuick 2.9

import PE.ControlType 1.0
import PE.Actions 1.0

import "../helpers"

TrailEmitter {
    id: trailEmitter

    property string uniqueId: ""
    property string controlType: ControlType.trailEmitter

    property int lifeSpanMin: 1000
    property int lifeSpanMax: 0

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
                "serializeToQmlFunc": function() { return "\"" + follow + "\""; }
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

    readonly property VariationHelper lifespanVariationHelper: VariationHelper {
        control: trailEmitter
        minValueProperty: "lifeSpanMin"
        maxValueProperty: "lifeSpanMax"
    }

    readonly property FrameHelper frameHelper: FrameHelper {
        control: trailEmitter
        parent: trailEmitter
    }

    QtObject {
        id: priv

        readonly property string prevFollow: trailEmitter.follow
        readonly property string prevGroup: trailEmitter.group
    }

    width: 100
    height: 100

    lifeSpan: lifespanVariationHelper.baseValue()
    lifeSpanVariation: lifespanVariationHelper.variationValue()

    onGroupChanged: {
        if (group.length > 0 && group === follow) {
            // HACK: to avoid crash when group and follow are the same
            // TODO: maybe to show error
            group = priv.prevGroup;
        } else {
            // HACK: to avoid crash when changing group at runtime
            Actions.doRerunParticleSystemWithDelay(trailEmitter, 100);
        }
    }

    onFollowChanged: {
        if (follow.length > 0 && follow === group) {
            // HACK: to avoid crash when group and follow are the same
            // TODO: maybe to show error
            follow = priv.prevFollow;
        } else {
            // HACK: to avoid crash when both group and follow are empty strings
            Actions.doRerunParticleSystemWithDelay(trailEmitter, 100);
        }
    }
}
