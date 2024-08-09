import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.4

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("States and Transition")

    Column{
        spacing: 15
        anchors.centerIn: parent

        Button{
            id: btnStop
            text: "Stop"
            onClicked: stopLightId.state = "stop"
        }
        Button{
            id: btnGo
            text: "Go"
            onClicked: stopLightId.state = "go"
        }
        StopLight{
            id: stopLightId
            state: "stop"
        }
    }
}
