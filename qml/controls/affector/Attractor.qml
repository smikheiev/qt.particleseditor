import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

Attractor {
    id: attractor

    property string uniqueId: ""
    property string controlType: ControlType.attractor

    readonly property SubControlHelper shapeHelper: SubControlHelper {
        control: attractor
        propertyName: "shape"
        compareValueTypeFunction: function(valueType) { return ControlType.isShape(valueType); }
    }

    readonly property GroupsHelper groupsHelper: GroupsHelper {
        control: attractor
    }

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: attractor
        props: [
            {
                "prop": "affectedParameter",
                "serializeToQmlFunc": serializeToQmlAffectedParameter,
            },
            {
                "prop": "proportionalToDistance",
                "serializeToQmlFunc": serializeToQmlProportionalToDistance,
            }
        ]
    }

    width: 100
    height: 100

    FrameHelper {
        control: attractor
    }

    function serializeToQmlAffectedParameter() {
        switch (affectedParameter) {
            case Attractor.Position:
                return "Attractor.Position";
            case Attractor.Velocity:
                return "Attractor.Velocity";
            case Attractor.Acceleration:
                return "Attractor.Acceleration";
        }
        return "";
    }

    function serializeToQmlProportionalToDistance () {
        switch (proportionalToDistance) {
            case Attractor.Constant:
                return "Attractor.Constant";
            case Attractor.Linear:
                return "Attractor.Linear";
            case Attractor.InverseLinear:
                return "Attractor.InverseLinear";
            case Attractor.Quadratic:
                return "Attractor.Quadratic";
            case Attractor.InverseQuadratic:
                return "Attractor.InverseQuadratic";
        }
        return "";
    }
}
