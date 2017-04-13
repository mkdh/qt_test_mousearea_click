import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: mainWindow

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    ToolMenu {
        id: zhToolMenu
        anchors.fill: parent

        visible: false
    }

    Rectangle{
        id:imgBottom
        width: parent.width
        height: 100
        y: parent.height - height
        color: "red"

        state: "SHOW_BOTTOM_MENU"
        MouseArea{
            anchors.fill: parent

        }
        states: [
            State {
                name: "SHOW_BOTTOM_MENU"
                PropertyChanges { target: imgBottom;  y: mainWindow.height - imgBottom.height }

            },
            State {
                name: "HIDDEN_BOTTOM_MENU"
                PropertyChanges { target: imgBottom;  y: mainWindow.height}

            }
        ]

        transitions: [
            Transition {
                from: "SHOW_BOTTOM_MENU"
                to: "HIDDEN_BOTTOM_MENU"
                PropertyAnimation { target: imgBottom; properties: "y"; duration: 500; easing.type: Easing.OutExpo  }
            },
            Transition {
                from: "HIDDEN_BOTTOM_MENU"
                to: "SHOW_BOTTOM_MENU"
                PropertyAnimation { target: imgBottom; properties: "y"; duration: 500 ; easing.type: Easing.InExpo }

            }
        ]

        Button{
            id:btnStitchMove
            text: "btnStitchMove"
            anchors.centerIn: parent

            onClicked: {
                console.log(imgBottom.state + zhToolMenu.visible + zhToolMenu.display)
                if(mainWindow.myDisapper())
                {
                    return;
                }

                zhToolMenu.height_menu = 100
                zhToolMenu.display = true

                mainWindow.show_bottom_banner(false)
            }
        }
    }

    function myDisapper()
    {

    }

    function show_bottom_banner(_b_show)
    {
        if(_b_show)
        {
            imgBottom.state = "SHOW_BOTTOM_MENU"
        }
        else
        {
            imgBottom.state = "HIDDEN_BOTTOM_MENU"
        }
    }
    Text {
        id: debug_message
        text: qsTr("")
    }
    function set_txt_debug_message(_txt_debug_message)
    {
        debug_message.text = _txt_debug_message
    }
}
