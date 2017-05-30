import QtQuick.Controls 2.2 as QtControls
import QtQuick.Layouts 1.1
import QtQuick 2.9

import "inputControls"

RowLayout {
    id: inputRow

    readonly property int inputControlTypeSlider: 1
    readonly property int inputControlTypeTextField: 2
    readonly property int inputControlTypeCheckBox: 3
    readonly property int inputControlTypeComboBox: 4
    readonly property int inputControlTypeImageSelector: 5
    readonly property int inputControlTypeColorSelector: 6

    readonly property Item inputControl: inputControlLoader.item

    property alias title: titleLabel.text

    property int inputControlType: 0
    property var inputControlProperties: ({})

    property QtObject bindTarget: null
    property string bindTargetProperty: ""

    QtObject {
        id: priv

        function tryToBind() {
            if (bindTarget && inputControl) {
                inputControl.bind(bindTarget, bindTargetProperty)
            }
        }
    }

    width: parent.width
    height: 34

    spacing: 2

    onBindTargetChanged: {
        priv.tryToBind()
    }

    Rectangle {
        id: titleLabelContainer

        Layout.preferredWidth: 100
        Layout.fillHeight: true

        color: "lightgray"

        QtControls.Label {
            id: titleLabel

            anchors {
                fill: parent
                margins: 2
            }

            verticalAlignment: QtControls.Label.AlignVCenter
            horizontalAlignment: QtControls.Label.AlignLeft

            wrapMode: QtControls.Label.WrapAtWordBoundaryOrAnywhere
        }
    }

    Loader {
        id: inputControlLoader

        Layout.minimumWidth: 100
        Layout.fillWidth: true
        Layout.fillHeight: true

        sourceComponent: {
            switch (inputControlType) {
                case inputControlTypeSlider:
                    return sliderComponent
                case inputControlTypeTextField:
                    return textFieldComponent
                case inputControlTypeCheckBox:
                    return checkBoxComponent
                case inputControlTypeComboBox:
                    return comboBoxComponent
                case inputControlTypeImageSelector:
                    return imageSelectorComponent
                case inputControlTypeColorSelector:
                    return colorSelectorComponent
            }
            return null
        }

        onStatusChanged: {
            if (status === Loader.Ready) {
                for (var prop in inputControlProperties) {
                    inputControlLoader.item[prop] = inputControlProperties[prop]
                }

                if (bindTarget) {
                    priv.tryToBind()
                }
            }
        }
    }

    Component { id: sliderComponent; Slider {} }
    Component { id: textFieldComponent; TextField {} }
    Component { id: checkBoxComponent; CheckBox {} }
    Component { id: comboBoxComponent; ComboBox {} }
    Component { id: imageSelectorComponent; ImageSelector {} }
    Component { id: colorSelectorComponent; ColorSelector {} }

    function getSliderProperties(from, to) {
        return { "from": from, "to": to }
    }
}
