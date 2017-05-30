TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11

include(quickflux/quickflux.pri)

SOURCES += sources/main.cpp \
    sources/fileio.cpp

HEADERS += \
    sources/fileio.h

RESOURCES += qml/_qml.qrc

DEFINES += QT_DEPRECATED_WARNINGS

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml
