import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4

import "samegame.js" as SameGame

Window {
    width: 490
    height: 720
    visible: true
    title: qsTr("Same Game")

    Rectangle{
        width: parent.width
        height: parent.height
        id: screenId
        SystemPalette{ id: activePalette}

        Item{
            width: parent.width
            anchors{
                top:parent.top;bottom: toolBar.top
            }
            Image{
                id:background
                anchors.fill: parent
                source: "qrc:/Resources/background.png"
                fillMode: Image.PreserveAspectCrop
            }

            Item{
                id: gameCanvas

                property int score: 0
                property int blocksize: 40

                width:parent.width - (parent.width % blocksize)
                height: parent.height - (parent.height % blocksize)
                anchors.centerIn: parent

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        SameGame.handleClick(mouse.x,mouse.y)
                    }
                }
            }
        }

        Dialog
        {
            id: dialog
            anchors.centerIn: parent
            z:100
        }

//        Dialog{
//            id: nameInputDialog
//            anchors.centerIn: parent
//            z:100

//            onClosed: {
//                if(nameInputDialog.inputText != "")
//                    SameGame.saveHighScore(nameInputDialog.inputText);
//            }
//        }

        Rectangle{
            id:toolBar
            width: parent.width
            height:30
            color: activePalette.window
            anchors.bottom: screenId.bottom

            Button{
                anchors{
                    //top: background.bottom
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }
                text: "New Game"
                //onClicked: console.log("This doesn't do anything yet...")
                onClicked: SameGame.startNewGame()
            }
            Text{
                id: score
                anchors {
                    right: parent.right; verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }
                text:"Score :" + gameCanvas.score;//"Score: who Knows?"
            }
        }
    }
}
