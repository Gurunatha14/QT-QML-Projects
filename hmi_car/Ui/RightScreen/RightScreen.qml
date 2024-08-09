import QtQuick 2.0
import QtLocation 5.12
import QtPositioning 5.12

Rectangle{
  id:rightScreenId

  anchors{
      top:parent.top
      bottom: bottomBarId.top
      right: parent.right
  }

  width: parent.width * 2/3

  Plugin{
      id:mapPluginId
      //name: "mapboxgl"
      name: "osm"
  }

  Map{
      anchors.fill: parent
      plugin: mapPluginId
      center: QtPositioning.coordinate(12.97,77.57) // Bengaluru
      zoomLevel:14
  }

  Image{
      id:lockIconId
      anchors{
          left:parent.left
          top:parent.top
          margins:20
      }

      width:parent.width/40
      fillMode: Image.PreserveAspectFit
      source:(systemHandler.carLocked ? "qrc:/Ui/Assets/lockIcon.png" : "qrc:/Ui/Assets/unlockIcon.png")
      MouseArea{
          anchors.fill: parent
          onClicked:{
              //console.log("Hi : "+systemHandler.carLocked )
              systemHandler.setCarLocked( !systemHandler.carLocked )

          }

      }

  }

  Text {
      id: dateTimeDisplayId
      anchors{
          left: lockIconId.right
          leftMargin: 40
          bottom: lockIconId.bottom
      }
      font.pixelSize: 12
      font.bold: true
      color: "black"
      text:systemHandler.currentTime
  }

  Text {
      id: outdoorTemperatureDisplayId
      anchors{
          left: dateTimeDisplayId.right
          leftMargin: 40
          bottom: lockIconId.bottom
      }
      font.pixelSize: 12
      font.bold: true
      color: "black"
      text:systemHandler.outdoorTemp + "°F"
  }

  Text {
      id: userNameDisplayId
      anchors{
          left: outdoorTemperatureDisplayId.right
          leftMargin: 40
          bottom: lockIconId.bottom
      }
      font.pixelSize: 12
      font.bold: true
      color: "black"
      text:systemHandler.userName
  }

  NavigationSearchBox{
      id:navSearchBoxId
      anchors{
          top:lockIconId.bottom
          left: lockIconId.left
          topMargin: 15
      }
      width: parent.width * 1/3
      height: parent.height *1/12
  }
}

