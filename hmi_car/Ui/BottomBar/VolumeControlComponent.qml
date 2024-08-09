import QtQuick 2.0

Item {
    property string fontColor: "#f0eded"

    Connections {
        target: audioController
        onVolumeLevelChanged :{
            //console.log("Test")
            visibleTimer.stop()
            volumeIconId.visible = false
            visibleTimer.start()

        }
    }

    Timer{
        id: visibleTimer
        interval:1000
        repeat:false
        onTriggered:{
            volumeIconId.visible = true
        }

    }

    // To find the component width
    Rectangle{
        anchors{
            left: decrementButtonId.left
            right: incrementButtonId.right
        }

        Component.onCompleted:{
            console.log("Width is " + width)
        }
    }

    width: 120 * (parent.width/1280)

   Rectangle{
       id:decrementButtonId
       anchors{
           right: volumeIconId.left
           rightMargin: 15
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
           onClicked: audioController.incrementVolume(-1)
       }
   }

   Image{
       id: volumeIconId
       height: parent.height * .5
       fillMode: Image.PreserveAspectFit
       anchors{
           right: incrementButtonId.left
           rightMargin: 15
           verticalCenter: parent.verticalCenter
       }
       source:{
           if(audioController.volumeLevel <= 1)
               return "qrc:/Ui/Assets/muteVolume.png"
           else if(audioController.volumeLevel <= 30)
               return "qrc:/Ui/Assets/volume1.png"
           else if(audioController.volumeLevel <= 70)
               return "qrc:/Ui/Assets/volume2.png"
           else
               return "qrc:/Ui/Assets/volume3.png"
       }
   }
   Text{
       id: volumeTextLabelId
       visible: !volumeIconId.visible
       anchors{
           centerIn: volumeIconId
       }
       color: fontColor
       font.pixelSize: 24
       text: audioController.volumeLevel
   }

   Rectangle{
       id:incrementButtonId
       anchors{
           right: parent.right
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
           onClicked: audioController.incrementVolume(1)
       }
   }
}
