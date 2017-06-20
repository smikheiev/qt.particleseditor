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
            {
                "prop": "groups",
                "serializeToJsonFunc": function() { return control.groupsHelper.serializeToJson(); },
                "deserializeFromJsonFunc": function(obj) { control.groupsHelper.deserializeFromJson(obj); },
                "serializeToQmlFunc": function() { return control.groupsHelper.serializeToQml(); },
            },
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
        readonly property var commonPropsEmitter: [
            {
                "prop": "acceleration",
                "serializeToJsonFunc": function() { return control.accelerationHelper.serializeToJson(); },
                "deserializeFromJsonFunc": function(obj) { return control.accelerationHelper.deserializeFromJson(obj); },
                "serializeToQmlFunc": function() { return control.accelerationHelper.serializeToQml() },
            },
            "emitRate",
            "enabled",
            "endSize",
            {
                "prop": "group",
                "serializeToQmlFunc": function() { return "\"" + control.group + "\""; }
            },
            "lifeSpan",
            "lifeSpanVariation",
            "maximumEmitted",
            "size",
            "sizeVariation",
            "startTime",
            {
                "prop": "system",
                "ignore": "json",
                "serializeToQmlFunc": function() { return control.system.uniqueId; },
            },
            {
                "prop": "velocity",
                "serializeToJsonFunc": function() { return control.velocityHelper.serializeToJson(); },
                "deserializeFromJsonFunc": function(obj) { return control.velocityHelper.deserializeFromJson(obj); },
                "serializeToQmlFunc": function() { return control.velocityHelper.serializeToQml(); },
            },
            "velocityFromMovement",
        ]

        readonly property bool isAffector: ControlType.isAffector(control.controlType)
        readonly property bool isEmitter: ControlType.isEmitter(control.controlType)
        readonly property bool isVisualControl: isAffector || isEmitter

        function getAllProps() {
            var allProps = commonProps;
            if (isVisualControl) {
                allProps = allProps.concat(commonPropsVisualControl);
            }
            if (isAffector) {
                allProps = allProps.concat(commonPropsAffector);
            }
            if (isEmitter) {
                allProps = allProps.concat(commonPropsEmitter);
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
            var ttype = typeof propObj;
            if (ttype === "string") {
                var propValue = obj[propObj];
                if (propValue !== undefined) {
                    control[propObj] = propValue;
                }
            } else if (ttype === "object") {
                var ignore = propObj.ignore;
                if (ignore === "json") {
                    continue;
                }

                var prop = propObj.prop;
                var obj2 = obj[prop];
                if (obj2 !== undefined) {
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
