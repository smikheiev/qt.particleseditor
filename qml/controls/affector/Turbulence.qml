import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Turbulence {
    id: turbulence

    property string uniqueId: ""
    property string controlType: ControlType.turbulence

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: turbulence
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }

    readonly property GroupsHelper groupsHelper: GroupsHelper {
        control: turbulence
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: turbulence
        props: [
            {
                "prop": "noiseSource",
                "serializeToJsonFunc": function() { return "" + noiseSource; },
                "serializeToQmlFunc": function() { return "\"" + noiseSource + "\""; },
            },
            "strength",
        ]
    }

    width: 100
    height: 100

    FrameHelper {
        control: turbulence
    }
}
