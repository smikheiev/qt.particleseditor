import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

LineShape {
    id: lineShape

    property string uniqueId: ""
    property string controlType: ControlType.lineShape

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: lineShape
        props: [
            "mirrored"
        ]
    }
}
