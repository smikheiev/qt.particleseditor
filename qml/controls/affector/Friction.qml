import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Friction {
    id: friction

    property string uniqueId: ""
    property string controlType: ControlType.friction

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: friction
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }

    readonly property GroupsHelper groupsHelper: GroupsHelper {
        control: friction
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: friction
        props: [
            "threshold",
            "factor",
        ]
    }

    width: 100
    height: 100

    FrameHelper {
        control: friction
    }
}
