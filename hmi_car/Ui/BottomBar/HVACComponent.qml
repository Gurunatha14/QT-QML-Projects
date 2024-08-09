import QtQuick 2.0

Item {
    property string fontColor: "#f0eded"
    property var hvacController

   width : 90 *(parent.width/1280)

   Rectangle{
       id:decrementButtonId
       anchors{
           left: parent.left
           top: parent.top
           bottom: parent.bottom
       }
       width: height/2
       color: "black"
       Text {
           id: decrementtextId
           text: "<"
           color: fontColor
           anchors.centerIn: parent
           font.pointSize: 12
       }
       MouseArea{
           anchors.fill: parent
           onClicked: hvacController.incrementTargetTemperature(-1)
       }
   }

   Text{
       id: targetTemperatureTextId
       anchors{
           left: decrementButtonId.right
           leftMargin: 15
           verticalCenter: parent.verticalCenter
       }
       color: fontColor
       font.pixelSize: 24
       text: hvacController.targetTemperature
   }

   Rectangle{
       id:incrementButtonId
       anchors{
           left: targetTemperatureTextId.right
           leftMargin: 15
           top: parent.top
           bottom: parent.bottom
       }
       width: height/2
       color: "black"
       Text {
           id: incrementtextId
           text: ">"
           color: fontColor
           anchors.centerIn: parent
           font.pointSize: 12
       }
       MouseArea{
           anchors.fill: parent
           onClicked: hvacController.incrementTargetTemperature(1)
       }
   }
}
