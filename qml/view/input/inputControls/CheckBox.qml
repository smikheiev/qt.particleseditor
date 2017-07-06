import QtQuick.Controls 2.2
import QtQuick 2.9

import "helpers"

CheckBox {
    id: checkBox

    readonly property BindingHelper bindingHelper: BindingHelper {}
    readonly property string valueProperty: "checked"
}
