#pragma once

#include <QObject>

class FileIO : public QObject
{
    Q_OBJECT

public:
    explicit FileIO(QObject* parent = 0);

    Q_INVOKABLE void saveFile(const QString& fileUrl, const QString& content);
    Q_INVOKABLE const QString readFile(const QString& fileUrl);

private:
    const QString getFilePath(const QString& fileUrl);

    static const QString fileUrlSuffix;
};
