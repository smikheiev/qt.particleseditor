import QtQuick.Particles 2.0

import PE.ControlType 1.0

import "../helpers"

MaskShape {
    id: maskShape

    property string uniqueId: ""
    property string controlType: ControlType.maskShape

    readonly property SerializeHelper serializeHelper: SerializeHelper {
        control: maskShape
        props: [
            {
                "prop": "source",
                "serializeToJsonFunc": function() { return "" + source; },
                "serializeToQmlFunc": function() { return "\"" + source + "\""; },
            },
        ]
    }
}
