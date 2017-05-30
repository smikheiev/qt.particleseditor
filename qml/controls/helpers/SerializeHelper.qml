import QtQuick 2.9

import PE.ControlType 1.0
import PE.Common 1.0

QtObjectWithKids {
    id: serializeHelper

    property QtObject control
    property var props: []

    QtObject {
        id: priv

        readonly property var commonProps: [
            {
                "prop": "controlType",
                "ignore": "qml",
            },
            {
                "prop": "uniqueId",
                "ignore": "qml",
            },
        ];
        readonly property var commonPropsVisualControl: [
            "width", "height", "x", "y",
        ];
        readonly property var commonPropsAffector: [
            "enabled",
//            "groups", // TODO: implement
            "once",
            {
                "prop": "shape",
                "serializeToJsonFunc": function() { return control.shapeHelper.serializeToJson(); },
                "deserializeFromJsonFunc": function(obj) { control.shapeHelper.deserializeFromJson(obj); },
                "serializeToQmlFunc": function(indent) { return control.shapeHelper.serializeToQml(indent); },
            },
            {
                "prop": "system",
                "ignore": "json",
                "serializeToQmlFunc": function() { return control.system.uniqueId; },
            },
//            "whenCollidingWith", // TODO: implement
        ]

        readonly property bool isVisualControl: ControlType.isAffector(control.controlType) ||
                                       ControlType.isEmitter(control.controlType)
        readonly property bool isAffector: ControlType.isAffector(control.controlType)

        function getAllProps() {
            var allProps = commonProps;
            if (isVisualControl) {
                allProps = allProps.concat(commonPropsVisualControl);
            }
            if (isAffector) {
                allProps = allProps.concat(commonPropsAffector);
            }
            allProps = allProps.concat(props);

            return allProps;
        }
    }

    function serializeToJson() {
        var obj = {};

        var allProps = priv.getAllProps();

        for (var i in allProps) {
            var propObj = allProps[i];
            var ttype = (typeof propObj);
            if (ttype === "string") {
                obj[propObj] = control[propObj];
            } else if (ttype === "object") {
                var ignore = propObj.ignore;
                if (ignore === "json") {
                    continue;
                }

                var prop = propObj.prop;
                var func = propObj.serializeToJsonFunc;
                if (func) {
                    var obj2 = func();
                    if (obj2) {
                        obj[prop] = obj2;
                    }
                } else {
                    obj[prop] = control[prop];
                }
            }
        }

        return obj;
    }

    function deserializeFromJson(obj) {
        if (!obj) {
            throw new Error("Parameter with deserialized properties not set");
        }

        var allProps = priv.getAllProps();

        for (var i in allProps) {
            var propObj = allProps[i];
            if (typeof propObj === "string") {
                control[propObj] = obj[propObj];
            } else {
                var ignore = propObj.ignore;
                if (ignore === "json") {
                    continue;
                }

                var prop = propObj.prop;
                var obj2 = obj[prop];
                if (obj2) {
                    var func = propObj.deserializeFromJsonFunc;
                    if (func) {
                        func(obj2);
                    } else {
                        control[prop] = obj2;
                    }
                }
            }
        }
    }

    function serializePropsToQml(indent) {
        var qml = "";
        var tabs = "";
        for (var i = 0; i < indent; ++i) {
            tabs += "    ";
        }

        var allProps = priv.getAllProps();

        qml += (tabs + "id: " + control.uniqueId + "\n");
        for (i in allProps) {
            var propObj = allProps[i];
            if (typeof propObj === "string") {
                qml += (tabs + propObj + ": " + control[propObj] + "\n");
            } else {
                var ignore = propObj.ignore;
                if (ignore === "qml") {
                    continue;
                }

                var prop = propObj.prop;
                var func = propObj.serializeToQmlFunc;
                if (func) {
                    var qml2 = func(indent);
                    if (qml2) {
                        qml += (tabs + prop + ": " + qml2 + "\n");
                    }
                } else {
                    qml += (tabs + prop + ": " + control[prop] + "\n");
                }
            }
        }

        return qml;
    }
}
