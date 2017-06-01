import QtQuick 2.9

Item {
    id: baseSettings

    default property alias childrenContainer: settingsRowsColumn.children

    property QtObject control: null
    readonly property string controlType: control && control.controlType ? control.controlType : ""

    implicitWidth: 250
    implicitHeight: childrenRect.height

    Column {
        id: settingsRowsColumn

        width: parent.width
        spacing: 0
    }
}
