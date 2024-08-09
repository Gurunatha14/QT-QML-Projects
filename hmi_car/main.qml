import QtQuick 2.12
import QtQuick.Window 2.12
import "Ui/BottomBar"
import "Ui/RightScreen"
import "Ui/LeftScreen"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("HMI For Car")

    LeftScreen{
       id: leftScreenId
    }

    RightScreen{
        id:rightScreenId
    }

    BottomBar{
        id:bottomBarId
    }
}
