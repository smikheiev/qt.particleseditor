import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "helpers"

ParticleSystem {
    id: particleSystem

    property string uniqueId: ""
    property string controlType: ControlType.particleSystem

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: particleSystem
        props: [
            "paused",
            "running",
        ]
    }
}
