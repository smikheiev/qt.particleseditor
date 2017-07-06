import QtQuick.Controls 2.2 as QtControls
import QtQuick.Layouts 1.1
import QtQuick 2.9

import "inputControls"

RowLayout {
    id: inputRow

    readonly property int inputControlTypeCheckBox: 1
    readonly property int inputControlTypeColorSelector: 2
    readonly property int inputControlTypeComboBox: 3
    readonly property int inputControlTypeImageSelector: 4
    readonly property int inputControlTypeSlider: 5
    readonly property int inputControlTypeSliderWithTextField: 6
    readonly property int inputControlTypeTextField: 7

    readonly property Item inputControl: inputControlLoader.item

    property alias title: titleLabel.text

    property int inputControlType: 0
    property var inputControlProperties: ({})

    property QtObject bindTarget: null
    property string bindTargetProperty: ""
    property string bindTargetPropertyWrite: ""

    QtObject {
        id: priv

        function tryToBind() {
            if (bindTarget && inputControl) {
                inputControl.bindingHelper.bind(
                    inputControl, inputControl.valueProperty, inputControl.valuePropertyWrite,
                    bindTarget, bindTargetProperty, bindTargetPropertyWrite);
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
                case inputControlTypeCheckBox:
                    return checkBoxComponent
                case inputControlTypeColorSelector:
                    return colorSelectorComponent
                case inputControlTypeComboBox:
                    return comboBoxComponent
                case inputControlTypeImageSelector:
                    return imageSelectorComponent
                case inputControlTypeSlider:
                    return sliderComponent
                case inputControlTypeSliderWithTextField:
                    return sliderWithTextFiledComponent;
                case inputControlTypeTextField:
                    return textFieldComponent
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

    Component { id: checkBoxComponent; CheckBox {} }
    Component { id: colorSelectorComponent; ColorSelector {} }
    Component { id: comboBoxComponent; ComboBox {} }
    Component { id: imageSelectorComponent; ImageSelector {} }
    Component { id: sliderComponent; Slider {} }
    Component { id: sliderWithTextFiledComponent; SliderWithTextFiled {} }
    Component { id: textFieldComponent; TextField {} }

    function getSliderProperties(from, to, stepSize, valueTextPrecision) {
        if (!stepSize) {
            stepSize = 1
        }
        if (!valueTextPrecision) {
            valueTextPrecision = 0
        }
        return { "from": from, "to": to, "stepSize": stepSize, "valueTextPrecision": valueTextPrecision }
    }
}
