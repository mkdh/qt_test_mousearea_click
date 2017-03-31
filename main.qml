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
        Button{
            id:btnStitchMove
            text: "btnStitchMove"
            anchors.centerIn: parent

            onClicked: {

                if(mainWindow.myDisapper()){
                    return;
                }

                if(zhToolMenu.visible == false)
                {
                    zhToolMenu.height_menu = 100
                    zhToolMenu.display = true

                    mainWindow.show_bottom_banner(false)
                }

            }

        }


    }

    PropertyAnimation {
        id:	anim_bottom_banner_top_to_down
        target:	imgBottom
        from: mainWindow.height - imgBottom.height; to: mainWindow.height
        properties: "y"
        easing.type: "OutExpo"
        duration: 1000
        onStarted: {
//          mainWindow._b_img_bottom_visible_state = false
        }
        onStopped: {
            //btnHiddenIcon.source = '/Icon/Up'
        }
    }
    PropertyAnimation {
        id:	anim_bottom_banner_down_to_top
        target:	imgBottom
        from: mainWindow.height; to: mainWindow.height - imgBottom.height
        properties: "y"
        easing.type: "OutExpo"
        duration: 1000
        onStarted: {
//            mainWindow._b_img_bottom_visible_state = true
        }
        onStopped: {
            //btnHiddenIcon.source = '/Icon/Up'
        }
    }
    function myDisapper()
    {

    }

    function show_bottom_banner(_b_show)
    {
        if(_b_show)//imgBottom.y == mainWindow.height - imgBottom.height
        {
            anim_bottom_banner_down_to_top.restart()
        }
        else// if(imgBottom.y == mainWindow.height)
        {
            anim_bottom_banner_top_to_down.restart();
        }
    }


}
