import QtQuick 2.0

Item {
     id:containerId
     property alias cellColor : rectangleId.color
     signal clickedmysignal(color cellColor)

     width: 40
     height: 20

     Rectangle{
         id:rectangleId
         border.color: "white"
         anchors.fill:parent

     }

     MouseArea{
         anchors.fill: parent
         onClicked: containerId. clickedmysignal(containerId.cellColor)
     }
}
