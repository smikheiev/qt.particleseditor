import QtQuick.Controls 1.4

import PE.Actions 1.0

MenuItem {
    id: menuItemAddControl

    property string controlType: ""

    onTriggered: {
        Actions.doCreateControl(controlType, true);
    }
}
