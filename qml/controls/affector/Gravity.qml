import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Gravity {
    id: gravity

    property string uniqueId: ""
    property string controlType: ControlType.gravity

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: gravity
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: gravity
        props: [
            "angle",
            "magnitude",
        ]
    }

    width: 100
    height: 100

    FrameHelper {
        control: gravity
    }
}
