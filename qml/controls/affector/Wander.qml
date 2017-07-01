import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Wander {
    id: wander

    property string uniqueId: ""
    property string controlType: ControlType.wander

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: wander
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }

    readonly property GroupsHelper groupsHelper: GroupsHelper {
        control: wander
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: wander
        props: [
            {
                "prop": "affectedParameter",
                "serializeToQmlFunc": serializeToQmlAffectedParameter,
            },
            "pace",
            "xVariance",
            "yVariance",
        ]
    }

    readonly property FrameHelper frameHelper: FrameHelper {
        control: wander
        parent: wander
    }

    width: 100
    height: 100

    function serializeToQmlAffectedParameter() {
        switch (affectedParameter) {
            case Wander.Position:
                return "Attractor.Position";
            case Wander.Velocity:
                return "Attractor.Velocity";
            case Wander.Acceleration:
                return "Attractor.Acceleration";
        }
        return "";
    }
}
