import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Color Picker")
    color: "lightgray"

    Text{
        id:helloTextId
        text: "Hello World!"
        y:30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
        font.bold: true

        MouseArea{
            id:mouseAreaId; anchors.fill: parent
        }
        states: State {
            name: "down"; when:mouseAreaId.pressed == true
            PropertyChanges {
                target: helloTextId; y:160; rotation:360; color:"red"

            }
        }

        transitions: Transition {
            from: ""
            to: "down"
            reversible: true
            ParallelAnimation{
                NumberAnimation{properties: "y,rotation"; duration:500; easing.type: Easing.InOutQuad}
                ColorAnimation{duration: 1000}
            }
        }
    }

   Grid{
       id:colorPickerId
       x:4
       anchors.bottom: parent.bottom
       anchors.bottomMargin: 20
       rows: 4
       columns: 3
       spacing: 4
       Cell{cellColor: "red"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "green"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "blue"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "yellow"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "beige"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "orange"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "black"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "white"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "yellowgreen"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "magenta"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "darkgray"; onClickedmysignal: helloTextId.color=cellColor }
       Cell{cellColor: "lightblue"; onClickedmysignal: helloTextId.color=cellColor }

   }

}
