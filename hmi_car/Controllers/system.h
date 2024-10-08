#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)

public:
    explicit System(QObject *parent = nullptr);


    bool carLocked() const;
    Q_INVOKABLE void setCarLocked(bool newCarLocked);

    int outdoorTemp() const;
    void setOutdoorTemp(int newOutdoorTemp);

    const QString &userName() const;
    void setUserName(const QString &newUserName);

    const QString &currentTime() const;
    void setCurrentTime(const QString &newCurrentTime);

    void curretTimeTimerimeout();

signals:

    void carLockedChanged();

    void outdoorTempChanged();

    void userNameChanged();

    void currentTimeChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
};

#endif // SYSTEM_H
