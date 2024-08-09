import QtQuick 2.0

Rectangle{
    id: containerId

//     property string inputText: textInput.text
//     signal closed

//    function show(text){
//        dialogText.text = textInput.text;
//        containerId.opacity = 1;
//        textInput.opacity = 0;
//    }

//    function showWithInput(text){
//        show(text);
//        textInput.opacity = 1;
//        textInput.focus = true;
//        textInput.text = ""
//    }

//    function hide(){
//        textInput.focus = false;
//        containerId.opacity = 0;
//        containerId.closed();
//    }

//    width: dialogText.width + 20;
//    height: dialogText.height + 20;
//    opacity: 0

//    Text{
//     id: dialogText
//     anchors{verticalCenter: parent.verticalCenter; left: parent.left; leftMargin:10}
//     text: ""


//    }

//    TextInput{
//        id: textInput
//        anchors{ verticalCenter:  parent.verticalCenter ; left: dialogText.right}
//        width: 80
//        text: ""

//        onAccepted: containerId.hide()  // close Dialog when enter is pressed

//    }

//    MouseArea{
//        anchors.fill: parent
//        onClicked:{
//        if(textInput.text == "" && textInput.opacity > 0)
//            textInput.openSoftWareInputPanel();
//        else
//            hide();
//        }
//    }

    function show(text) {
           dialogText.text = text;
           containerId.opacity = 1;
       }

       function hide() {
           containerId.opacity = 0;
       }

       width: dialogText.width + 20
       height: dialogText.height + 20
       opacity: 0

       Text {
           id: dialogText
           anchors.centerIn: parent
           text: ""
       }

       MouseArea {
           anchors.fill: parent
           onClicked: hide();
       }
}
