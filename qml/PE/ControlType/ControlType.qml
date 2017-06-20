pragma Singleton

import QtQuick 2.9

QtObject {
    readonly property string particleSystem: "ParticleSystem"

    readonly property string emitter: "Emitter"
    readonly property string trailEmitter: "TrailEmitter"

    readonly property string imageParticle: "ImageParticle"

    readonly property string age: "Age"
    readonly property string attractor: "Attractor"
    readonly property string friction: "Friction"
    readonly property string gravity: "Gravity"
    readonly property string turbulence: "Turbulence"
    readonly property string wander: "Wander"

    readonly property string angleDirection: "AngleDirection"
    readonly property string pointDirection: "PointDirection"
    readonly property string targetDirection: "TargetDirection"

    readonly property string ellipseShape: "EllipseShape"
    readonly property string lineShape: "LineShape"
    readonly property string maskShape: "MaskShape"

    function isParticleSystem(controlType) {
        return controlType === particleSystem;
    }

    function isEmitter(controlType) {
        return controlType === emitter ||
                controlType === trailEmitter;
    }

    function isParticle(controlType) {
        return controlType === imageParticle;
    }

    function isAffector(controlType) {
        return controlType === age ||
               controlType === attractor ||
               controlType === friction ||
               controlType === gravity ||
               controlType === turbulence ||
               controlType === wander;
    }

    function isDirection(controlType) {
        return controlType === angleDirection ||
               controlType === pointDirection ||
               controlType === targetDirection;
    }

    function isShape(controlType) {
        return controlType === ellipseShape ||
               controlType === lineShape ||
               controlType === maskShape;
    }
}
