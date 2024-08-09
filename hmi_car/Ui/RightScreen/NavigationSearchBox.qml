import QtQuick 2.0

Rectangle{
    id: navSearchBoxId
    color: "#f0f0f0"
    radius:5

    Image {
        id: searchIconId
        source: "qrc:/Ui/Assets/search.png"
        anchors{
            left:parent.left
            leftMargin: 25
            verticalCenter: parent.verticalCenter
        }
        height:parent.height *.45
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: navigationPlaceHolderText
        visible:  navigationTextInput.text == ""
        color: "#373737"
        text: "Navigate"
        anchors{
           verticalCenter: parent.verticalCenter
           left: searchIconId.right
           leftMargin: 20
        }
    }

    TextInput{
        id: navigationTextInput
        clip: true
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: searchIconId.right
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 15
    }
}
