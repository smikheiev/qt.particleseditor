pragma Singleton

import QtQuick 2.9

import QuickFlux 1.0

QtObject {
    readonly property string sceneCreated: "sceneCreated"
    function doSceneCreated(scene) {
        AppDispatcher.dispatch(sceneCreated, { scene: scene });
    }

    readonly property string chooseFileToOpen: "chooseFileToOpen"
    function doChooseFileToOpen() {
        AppDispatcher.dispatch(chooseFileToOpen);
    }

    readonly property string fileToOpenChosen: "fileToOpenChosen"
    function doFileToOpenChosen(file) {
        AppDispatcher.dispatch(fileToOpenChosen, { file: file });
    }

    readonly property string chooseFileToSave: "chooseFileToSave"
    function doChooseFileToSave() {
        AppDispatcher.dispatch(chooseFileToSave);
    }

    readonly property string fileToSaveChosen: "fileToSaveChosen"
    function doFileToSaveChosen(file) {
        AppDispatcher.dispatch(fileToSaveChosen, { file: file });
    }

    readonly property string controlSelected: "controlSelected"
    function doControlSelected(control) {
        AppDispatcher.dispatch(controlSelected, { control: control });
    }

    readonly property string createControl: "createControl"
    function doCreateControl(controlType, selectControl, controlProps, parentControlId) {
        AppDispatcher.dispatch(createControl, { controlType: controlType, selectControl: selectControl, controlProps: controlProps, parentControlId: parentControlId });
    }

    readonly property string removeSelectedControl: "removeSelectedControl"
    function doRemoveSelectedControl() {
        AppDispatcher.dispatch(removeSelectedControl);
    }

    readonly property string removeAllControls: "removeAllControls"
    function doRemoveAllControls() {
        AppDispatcher.dispatch(removeAllControls);
    }

    readonly property string modelUpdated: "modelUpdated"
    function doModelUpdated(model) {
        AppDispatcher.dispatch(modelUpdated, { model: model });
    }

    readonly property string changeControlId: "changeControlId"
    function doChangeControlId(control, newId) {
        AppDispatcher.dispatch(changeControlId, { control: control, newId: newId });
    }

    readonly property string changeControlIdError: "changeControlIdError"
    function doChangeControlIdError(control) {
        AppDispatcher.dispatch(changeControlIdError, { control: control });
    }

    readonly property string openSettingsDialog: "openSettingsDialog"
    function doOpenSettingsDialog() {
        AppDispatcher.dispatch(openSettingsDialog);
    }

    readonly property string testDialogNeeded: "testDialogNeeded"
    function doTestDialogNeeded() {
        AppDispatcher.dispatch(testDialogNeeded);
    }

    readonly property string openTestDialog: "openTestDialog"
    function doOpenTestDialog(qml) {
        AppDispatcher.dispatch(openTestDialog, { qml: qml });
    }

    readonly property string deserializationDone: "deserializationDone"
    function doDeserializationDone() {
        AppDispatcher.dispatch(deserializationDone);
    }
}
