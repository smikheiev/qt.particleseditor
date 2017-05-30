#include <QTextStream>
#include <QFile>

#include "fileio.h"

const QString FileIO::fileUrlSuffix = QStringLiteral("file:///");

FileIO::FileIO(QObject* parent)
    : QObject(parent)
{
}

void FileIO::saveFile(const QString& fileUrl, const QString& content)
{
    const QString filePath = getFilePath(fileUrl);
    QFile file(filePath);

    if (file.open(QIODevice::WriteOnly))
    {
        QTextStream stream(&file);
        stream << content;
        stream.flush();

        file.close();
    }
}

const QString FileIO::readFile(const QString& fileUrl)
{
    const QString filePath = getFilePath(fileUrl);
    QFile file(filePath);

    if (file.open(QIODevice::ReadOnly))
    {
        QTextStream stream(&file);
        QString content;
        stream >> content;

        file.close();

        return content;
    }

    return "";
}

const QString FileIO::getFilePath(const QString& fileUrl)
{
    if (fileUrl.indexOf(fileUrlSuffix) == 0)
    {
        return fileUrl.mid(fileUrlSuffix.length());
    }

    return fileUrl;
}
