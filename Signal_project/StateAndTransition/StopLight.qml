import QtQuick 2.0

Rectangle{
    id: signage
    width: 100
    height: 250
    color: "yellow"
    border.color: "black"
    border.width: 1

    gradient: Gradient{
        GradientStop{ position:0.0; color: "yellow"}
        GradientStop{ position:1.0; color: "#B8B812"}
        //GradientStop{ position:2.0; color: "green"}
    }

    Column{
        spacing: 50
        anchors.centerIn: parent

        Light{
            id: redLight
        }
        Light{
            id: greenLight
        }
    }

    states: [
        State {
            name: "stop"
            PropertyChanges {target:redLight; color:"red"}
            PropertyChanges {target:greenLight; color:"darkgreen"}
        },
        State {
            name: "go"
            PropertyChanges {target:redLight; color:"darkred"}
            PropertyChanges {target:greenLight; color:"lime"}
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"
            PropertyAnimation { target: redLight;properties: "color"; duration: 1000}
            PropertyAnimation { target: greenLight;properties: "color"; duration: 1000}
        }
    ]
}
