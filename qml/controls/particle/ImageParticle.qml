import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

ImageParticle {
    id: imageParticle

    property string uniqueId: ""
    property string controlType: ControlType.imageParticle

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: imageParticle
        props: [
            "alpha",
            "alphaVariation",
            "autoRotation",
            "blueVariation",
            {
                "prop": "color",
                "serializeToJsonFunc": function() { return "" + color; },
                "serializeToQmlFunc": function() { return "\"" + color + "\""; },
            },
//            "colorTable", // TODO: implement
            "colorVariation",
            {
                "prop": "entryEffect",
                "serializeToQmlFunc": serializeToQmlEntryEffect,
            },
            "greenVariation",
//            "opacityTable", // TODO: implement
            "redVariation",
            "rotation",
            "rotationVariation",
            "rotationVelocity",
            "rotationVelocityVariation",
//            "sizeTable", // TODO: implement
            {
                "prop": "source",
                "serializeToJsonFunc": function() { return "" + source; },
                "serializeToQmlFunc": function() { return "\"" + source + "\""; },
            },
            {
                "prop": "system",
                "ignore": "json",
                "serializeToQmlFunc": function() { return system.uniqueId; },
            },
//            "xVector", // TODO: implement
//            "yVector", // TODO: implement
        ]
    }

    width: 100
    height: 100

    function serializeToQmlEntryEffect() {
        switch (entryEffect) {
            case ImageParticle.None:
                return "ImageParticle.None";
            case ImageParticle.Fade:
                return "ImageParticle.Fade";
            case ImageParticle.Scale:
                return "ImageParticle.Scale";
        }
        return "";
    }
}
