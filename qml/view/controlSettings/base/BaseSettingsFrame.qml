import QtQuick.Controls 2.2
import QtQuick 2.9

Frame {
    id: baseSettingsFrame

    default property alias childrenContainer: settingsRowsColumn.children

    implicitWidth: parent.width
    padding: 4

    Column {
        id: settingsRowsColumn

        width: parent.width
        spacing: 2
    }
}
