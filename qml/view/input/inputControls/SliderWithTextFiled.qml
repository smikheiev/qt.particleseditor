import QtQuick.Layouts 1.3
import QtQuick 2.9

import "helpers"

Item {
    id: sliderWithTextField

    readonly property BindingHelper bindingHelper: BindingHelper {}
    readonly property string valueProperty: "value"

    property alias from: slider.from
    property alias to: slider.to
    property alias stepSize: slider.stepSize
    property alias valueTextPrecision: slider.valueTextPrecision
    property alias value: slider.value

    onValueChanged: {
        if (!textField.activeFocus) {
            textField.text = value.toFixed(valueTextPrecision);
        }
    }

    RowLayout {
        id: rowLayout

        anchors {
            fill: parent
        }

        Slider {
            id: slider

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        TextField {
            id: textField

            Layout.preferredWidth: rowLayout.width / 6
            Layout.fillHeight: true

            text: value

            onTextChanged: {
                var newValue = parseFloat(text);
                if (newValue !== sliderWithTextField.value) {
                    sliderWithTextField.value = newValue;
                }
            }

            onEditingFinishedHandler: function() {
                textField.text = sliderWithTextField.value.toFixed(valueTextPrecision);
            }
        }
    }
}
