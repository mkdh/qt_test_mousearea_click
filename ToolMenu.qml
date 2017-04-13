import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id:toolMenu
    color: Qt.rgba(0, 1, 0,0.5)
    property bool display: false
    property rect rectHandle1: rectHandle1
    property real height_menu: height * 0.06

    property string tag: "ToolMenu.qml => "
    state: "HIDDEN_TOOL_MENU"

    // ###
    /*
    // not ok: method 0
    // Below code work fine here but the result is not what I want.
    // I did not set visible value in this method.
    // Hence, the toolMenu.visible = true when I let "toolMenu.opacity = 0".
    // And the toolMenu's mousearea event still occur when toolMenu disappear.
    // That is not what I want.

    //update:
    //I use state and transitions instead of plain PropertyAnimation.

    MouseArea{
        anchors.fill: parent
        onClicked: {
            mainWindow.set_txt_debug_message(tag + "display: " + display + "- " + toolMenu.state + Math.random())

            if(display)
            {
                mainWindow.show_bottom_banner(true)
                display = false
            }
        }
    }

    states: [
        State {
            name: "SHOW_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 1 }

        },
        State {
            name: "HIDDEN_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 0}

        }
    ]

    transitions: Transition {
        SequentialAnimation {
            PropertyAnimation { target: toolMenu; properties: "opacity"; duration: 1000}

        }
    }
*/

    /*
    // not ok: method 1
    // I want to set visible = false when the green disappear.
    // But the issue will occur here when I set visible = false as below code

    // update:
    // I add visible value in State and Transition.

    MouseArea{
        anchors.fill: parent
        onClicked: {
            mainWindow.set_txt_debug_message(tag + "display: " + display + "- " + toolMenu.state + Math.random())

            if(display)
            {
                mainWindow.show_bottom_banner(true)
                display = false
            }
        }
    }

    states: [
        State {
            name: "SHOW_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 1 ; visible: true}

        },
        State {
            name: "HIDDEN_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 0; visible: false}

        }
    ]

    transitions: Transition {
        SequentialAnimation {
            PropertyAnimation { target: toolMenu; properties: "opacity"; duration: 1000}
            PropertyAnimation { target: toolMenu; properties: "visible"}

        }
    }
*/

    /*
    // not ok: method 2
    // I doubt the place for visible which I put is the wrong place in logic.
    // Hence, I try to use update visible directly.

    // update:
    // remove visible from State and Transition.
    // add onOpacityChanged event.


    //visible: opacity != 0 // <-- not work here !?
    onOpacityChanged: {
        visible = opacity != 0
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            mainWindow.set_txt_debug_message(tag + "display: " + display + "- " + toolMenu.state + Math.random())

            if(display)
            {
                mainWindow.show_bottom_banner(true)
                display = false
            }
        }
    }

    states: [
        State {
            name: "SHOW_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 1}

        },
        State {
            name: "HIDDEN_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 0}

        }
    ]

    transitions: Transition {
        SequentialAnimation {
            PropertyAnimation { target: toolMenu; properties: "opacity"; duration: 1000}
        }
    }
*/
    /*
    // not ok: method 3
    // This is more stable than method 2. But the issue still exit in this method
    // I find that the MouseArea's event in Rectangle seems more stable.

    // update:
    // I add Rectangle and I let the Rectangle's onClicked event is the same with toolMenu's onClicked event.
    // note: the Rectangle's color = Qt.rgba(0, 0, 1, 0.5)


    onOpacityChanged: {
        visible = opacity != 0
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            mainWindow.set_txt_debug_message(tag + "display: " + display + "- " + toolMenu.state + Math.random())

            if(display)
            {
                mainWindow.show_bottom_banner(true)
                display = false
            }
        }
    }

    states: [
        State {
            name: "SHOW_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 1}

        },
        State {
            name: "HIDDEN_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 0}

        }
    ]

    transitions: Transition {
        SequentialAnimation {
            PropertyAnimation { target: toolMenu; properties: "opacity"; duration: 1000}

        }
    }
    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(0, 0, 1, 0.5)

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainWindow.set_txt_debug_message(tag + "display: " + display + "- " + toolMenu.state + Math.random())

                if(display)
                {
                    mainWindow.show_bottom_banner(true)
                    display = false
                }
            }
        }
    }
*/
    // not ok:method 4
    // I think I could remove toolMenu's onClicked event. And I think the result should be the same with method 3

    // update:
    // Hence, I remove toolMenu's onClicked event in the method 4.

    onOpacityChanged: {
        visible = opacity != 0
    }

    states: [
        State {
            name: "SHOW_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 1}

        },
        State {
            name: "HIDDEN_TOOL_MENU"
            PropertyChanges { target: toolMenu;  opacity: 0}

        }
    ]

    transitions: Transition {
        SequentialAnimation {
            PropertyAnimation { target: toolMenu; properties: "opacity"; duration: 1000}

        }
    }

    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(0, 0, 1, 0.5)

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainWindow.set_txt_debug_message(tag + "display: " + display + "- " + toolMenu.state + Math.random())

                if(display)
                {
                    mainWindow.show_bottom_banner(true)
                    display = false
                }
            }
        }
    }

    //###







    onDisplayChanged: {
        console.log(display + toolMenu.state)

        if(display)
        {
            toolMenu.visible = true
            toolMenu.opacity = 1
            toolMenu.state = "SHOW_TOOL_MENU"
        }
        else
        {
            toolMenu.state = "HIDDEN_TOOL_MENU"
        }
    }






    ListModel {
        id: funList
        ListElement {name: "1";name2:"Up";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/Up.png"}
        ListElement {name: "2";name2:"Down";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/Down.png"}
        ListElement {name: "3";name2:"Left";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/Left.png"}
        ListElement {name: "4";name2:"Right";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/Right.png"}
        ListElement {name: "5";name2:"Center";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/Center.png"}
        ListElement {name: "6";name2:"H flip";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/HorizontalFlip.png"}
        ListElement {name: "7";name2:"V flip";mySource:"qrc:/ToolMenu/Resource/Image/ToolMenu/VerticalFlip.png"}
    }

    Rectangle{
        id:rectListBackgroung

        color: Qt.rgba(3/255,110/255,184/255,1)//"green" // "#00ffffff" //
        height: height_menu//parent.height * 0.06//100
        width: parent.width
        x: 0
        anchors.bottom: parent.bottom

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("rectListBackgroung's click")
            }
        }

        ListView {
            id:lvWholeMenu
            //            anchors.centerIn: parent
            anchors.left: parent.left

            width: parent.height * funList.count * 1.2 //parent.width * 0.95
            height: parent.height
            model: funList
            orientation: ListView.Horizontal
            delegate: Rectangle{
                height: parent.height
                width:   lvWholeMenu.width/funList.count
                color: "#00ffffff" //"yellow" //

                Button{
                    id:btn_tool
                    anchors.fill: parent
                    onClicked: {
                        mainWindow.show_bottom_banner(true)
                        display = false
                    }
                }
            }
        }
    }

}
