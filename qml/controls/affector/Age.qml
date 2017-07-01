import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Age {
    id: age

    property string controlType: ControlType.age
    property string uniqueId: ""

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: age
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }

    readonly property GroupsHelper groupsHelper: GroupsHelper {
        control: age
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: age
        props: [
            "advancePosition",
            "lifeLeft",
        ]
    }

    readonly property FrameHelper frameHelper: FrameHelper {
        control: age
        parent: age
    }

    width: 100
    height: 100
}
