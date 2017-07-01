import QtQuick 2.9

import PE.Common 1.0

QtObjectWithKids {
    id: variationHelper

    property QtObject control: null
    property string minValueProperty: ""
    property string maxValueProperty: ""

    QtObject {
        id: priv

        readonly property var minValue: control[minValueProperty]
        readonly property var maxValue: control[maxValueProperty]
        readonly property bool hasVariation: maxValue > minValue
    }

    function baseValue() {
        if (priv.hasVariation) {
            return (priv.minValue + priv.maxValue) / 2;
        }
        return priv.minValue;
    }

    function variationValue() {
        if (priv.hasVariation) {
            return (priv.maxValue - priv.minValue) / 2;
        }
        return 0;
    }
}
