import QtQuick 2.0

Item {
    id: block

    property int type: 0

     property bool spawned: false

    Behavior on x{
        enabled: spawned;
        SpringAnimation{spring:2; damping:0.2}
    }
    Behavior on y{
        SpringAnimation{spring:2; damping:0.2}
    }
    Image{
        id: img
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        source:{
        if(type == 0)
            return "qrc:/Resources/redball.png"; // red
        else if(type == 1)
            return "qrc:/Resources/blueball.png"; //blue
        else
            return "qrc:/Resources/greenball.png"; //green
        }
     }
}
