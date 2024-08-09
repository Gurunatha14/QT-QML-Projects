import QtQuick 2.0

Rectangle
{
 id: containerId

 property string text: "Button"

 signal clicked

 width: buttonLabelId.width + 20; height: buttonLabelId.height + 5
 border {width: 1; color: Qt.darker(activePalette.button)}
 smooth: true
 radius:8

 //color the button with a gradient:

 gradient: Gradient{
     GradientStop{
         position: 0.0
         color: {
             if(mouseareaId.pressed)
                 return activePalette.dark
             else
                 return activePalette.light
         }
     }
     GradientStop{position: 1.0; color: activePalette.button}
 }

 MouseArea{
     id:mouseareaId
     anchors.fill: parent
     onClicked: containerId.clicked();
 }

 Text{
     id: buttonLabelId
     anchors.centerIn: containerId
     color: activePalette.buttonText
     text:containerId.text
 }

}
