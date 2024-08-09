import QtQuick 2.0

Rectangle{
    id: bottomBarId
    anchors{
        left:parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height/12

    Image{
       id: carSettingIconId
       anchors{
           verticalCenter: parent.verticalCenter
           left: parent.left
           leftMargin: 30
       }
       height: parent.height * .85
       fillMode: Image.PreserveAspectFit
       source: "qrc:/Ui/Assets/carIcon.png"
    }

    HVACComponent{
        id: driverHVACControlId
        anchors{
           top: parent.top
           bottom: parent.bottom
           left: carSettingIconId.right
           leftMargin: 150
        }
        hvacController: driverHVAC
    }
    HVACComponent{
        id: passengerHVACControlId
        anchors{
           top: parent.top
           bottom: parent.bottom
           right: volumeControlId.left
           rightMargin: 150
        }
        hvacController: passengerHVAC
    }

  VolumeControlComponent{
      id: volumeControlId
      anchors{
          //verticalCenter: parent.verticalCenter
          right: parent.right
          rightMargin: 30
          top: parent.top
          bottom: parent.bottom
      }
  }
  PhoneCallApplication{
      id: phonecallId
      anchors{
          left: driverHVACControlId.right
          leftMargin: 150
          top: parent.top
          bottom: parent.bottom
      }
  }

  MusicApplication{
      id:musicId
      anchors{
          left: phonecallId.right
          leftMargin: 50
          top: parent.top
          bottom: parent.bottom
      }
  }
}
