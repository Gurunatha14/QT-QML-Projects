import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    id:root
    width: 500
    height: 500
    visible: true
    title: qsTr("Mouse Monitor")

    Row{
        id: tools

        Button{
            id : clear
            text:"Clear"
            onClicked: {
                canvas.clear()
            }
        }
        Button{
            id : save
            text:"Save"
            onClicked: {
                 mouse.save()
            }
        }
    }
    Canvas{
        id: canvas
        anchors.top: tools.bottom
        width:500
        height:500
        property int lastX: 0
        property int lastY: 0

        function clear(){
            var ctx = getContext("2d")
            ctx.reset()
            canvas.requestPaint()
            mouse.clear()
        }
        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidth = 2
            ctx.strokeStyle = color.green

            ctx.beginPath()

            ctx.moveTo(lastX,lastY)
            
            lastX = area.mouseX
            lastY=area.mouseY
            ctx.lineTo(lastX,lastY)

            ctx.stroke()

            mouse.test();
            mouse.add(lastX,lastY);
            mouse.add(Qt.point(lastX,lastY))
        }

        MouseArea{
            id: area
            anchors.fill: parent
            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }
            onPositionChanged: {
                canvas.requestPaint()
            }
        }

    }
}
