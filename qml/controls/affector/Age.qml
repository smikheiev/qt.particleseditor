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

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: age
        props: [
            "advancePosition",
            "lifeLeft",
        ]
    }

    width: 100
    height: 100

    FrameHelper {
        control: age
    }
}
