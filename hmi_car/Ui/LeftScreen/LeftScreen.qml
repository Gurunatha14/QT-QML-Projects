import QtQuick 2.0

Rectangle{
    id: leftScreenId
    anchors{
        left: parent.left
        right: rightScreenId.left
        bottom: bottomBarId.top
        top: parent.top
    }
    color: "white"

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width *.85
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Ui/Assets/smallCarRender.png"
    }
}
