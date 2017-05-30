#include <QQmlApplicationEngine>
#include <QApplication>
#include <QQmlContext>

#include "fileio.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QCoreApplication::setApplicationName(QStringLiteral("Qt Particles Editor"));
    QCoreApplication::setOrganizationDomain(QStringLiteral("serhiico.com"));
    QCoreApplication::setOrganizationName(QStringLiteral("SerhiiCo"));

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();

    FileIO fileIO;
    context->setContextProperty("_fileIO", &fileIO);

    engine.addImportPath(QStringLiteral("qrc:/"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
