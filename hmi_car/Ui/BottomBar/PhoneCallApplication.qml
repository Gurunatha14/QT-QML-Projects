import QtQuick 2.0

Item {
    id:root
    property QtObject obj
    Rectangle{
       id:phoneCallRectId
       height: parent.height/12
       width: height * .8
        color: "black"
       anchors{
           left: parent.left
           top: parent.top
           bottom: parent.bottom
       }

       Image{
            id: phoneCallImageId
            height: parent.height * .8
            fillMode: Image.PreserveAspectFit
            anchors{

                verticalCenter: parent.verticalCenter
            }
            source: "qrc:/Ui/Assets/Phonecall.png"

        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                  if(!obj){
                      obj = Qt.createComponent("qrc:/Ui/BottomBar/PhoneCallClickedWindow.qml").createObject()
                     // var window    = component.

                  }
                  obj.show()



            }
        }

    }

}
