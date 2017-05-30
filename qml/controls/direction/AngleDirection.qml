import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

AngleDirection {
    id: angleDirection

    property string uniqueId: ""
    property string controlType: ControlType.angleDirection

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: angleDirection
        props: [
            "angle",
            "angleVariation",
            "magnitude",
            "magnitudeVariation"
        ]
    }
}
