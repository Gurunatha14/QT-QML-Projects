import QtQuick 2.0
//import Qt.labs.particles 2.12


Item {
    id: block

    property int type: 0
    property bool dying: false

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
//        opacity: 0

//        Behavior on opacity {
//            NumberAnimation { properties: "opacity"; duration: 200}
//        }

     }

//    Particles{
//        id: particles
//        width: 1
//        height : 1

//        anchors.centerIn: parent

//        emissionRate: 0
//        lifeSpan: 700; lifeSpanDeviation: 600
//        angle: 0; angleDeviation: 360
//        velocity: 100; velocityDeviation: 30
//        source: {
//            if(type == 0)
//                return "qrc:/Resources/redball.png"; // red
//            else if(type == 1)
//                return "qrc:/Resources/blueball.png"; //blue
//            else
//                return "qrc:/Resources/greenball.png"; //green
//        }
//    }

//    states:[
//        State {
//            name: "Alivestate"
//            when: spawned == true && dying == false
//            PropertyChanges {
//                target: img;opacity: 1
//            }

//        },
//        State {
//            name: "DeathState"
//            when: dying == true
//            StateChangeScript{script: particles.burst(50);}
//            PropertyChanges {
//                target: img
//                opacity: 0

//            }
//            StateChangeScript{script: block.destroy(1000);}
//        }
//    ]
}
