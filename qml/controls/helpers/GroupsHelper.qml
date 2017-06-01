import QtQuick 2.9

import PE.Common 1.0

QtObjectWithKids {
    id: groupsHelper

    property QtObject control

    function setGroupsFromText(text) {
        if (text.length === 0) {
            control.groups = [];
        } else {
            control.groups = text.split(",");
        }
    }

    function getGroupsText() {
        return control.groups.join(",");
    }

    function serializeToJson() {
        return getGroupsText();
    }

    function deserializeFromJson(obj) {
        if (obj !== undefined) {
            setGroupsFromText(obj);
        }
    }

    function serializeToQml() {
        var qml = "[";
        for (var i = 0, length = control.groups.length; i < length; ++i) {
            var group = control.groups[i];
            qml += "\"" + group + "\"";
            if (i < length - 1) {
                qml += ",";
            }
        }
        qml += "]";
        return qml;
    }
}
