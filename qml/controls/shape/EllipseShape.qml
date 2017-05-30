import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

EllipseShape {
    id: ellipseShape

    property string uniqueId: ""
    property string controlType: ControlType.ellipseShape

    property SerializeHelper serializeHelper: SerializeHelper {
        control: ellipseShape
        props: [
            "fill"
        ]
    }
}
