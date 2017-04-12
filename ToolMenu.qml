import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id:toolMenu
    color: Qt.rgba(0, 1, 0,0.5)
    property bool display: false
    property rect rectHandle1: rectHandle1
    property real height_menu: height * 0.06

    state: "HIDDEN_TOOL_MENU"

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
        PropertyAnimation { target: toolMenu; properties: "opacity"; duration: 1000 }
    }

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

    Text {
        id: debug_message
        text: qsTr("")
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            debug_message.text = "display: " + display + "- " + toolMenu.state + Math.random()
            if(display)
            {
                mainWindow.show_bottom_banner(true)
                display = false
            }
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
