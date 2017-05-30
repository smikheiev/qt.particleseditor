import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

PointDirection {
    id: pointDirection

    property string uniqueId: ""
    property string controlType: ControlType.pointDirection

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: pointDirection
        props: [
            "x",
            "xVariation",
            "y",
            "yVariation"
        ]
    }
}
