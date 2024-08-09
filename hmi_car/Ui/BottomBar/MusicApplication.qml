import QtQuick 2.0


Item {
    id:root
    property QtObject obj

    Rectangle{
       id:musicRectId
       height: parent.height/12
       width: height * .8
        color: "black"
       anchors{
           left: parent.left
           top: parent.top
           bottom: parent.bottom
       }
       Image{
            id: musicImageId
            height: parent.height * .8
            fillMode: Image.PreserveAspectFit
            anchors{

                verticalCenter: parent.verticalCenter
            }
            source: "qrc:/Ui/Assets/Music.png"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(!obj){
                     obj = Qt.createComponent("qrc:/Ui/BottomBar/MusicClickedWindow.qml").createObject();
//                    var window    = component.createObject(root)
                }
                obj.show()
            }
        }

    }

}

