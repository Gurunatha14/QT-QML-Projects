#ifndef AUDIOCONTROLLER_H
#define AUDIOCONTROLLER_H

#include <QObject>

class AudioController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged)
public:
    explicit AudioController(QObject *parent = nullptr);

    int volumeLevel() const;
    void setVolumeLevel(int newVolumeLevel);

    Q_INVOKABLE void incrementVolume(const int &val);

signals:

   void volumeLevelChanged();

private:


    int m_volumeLevel;
};

#endif // AUDIOCONTROLLER_H
