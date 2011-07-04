import QtQuick 1.0

Rectangle {

  id: titleBar
  height: 25
  anchors.right: parent.right; anchors.left: parent.left; anchors.top: parent.top
  color: colors.bg
    
  MouseArea{
    anchors.fill: parent;
    property variant clickPos: "1,1"
    onPressed: clickPos  = Qt.point(mouse.x,mouse.y)
    onPositionChanged: {
      var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
      mainwindow.pos = Qt.point(mainwindow.pos.x+delta.x, mainwindow.pos.y+delta.y)
    }
  }

  //Menu Button
  Rectangle{
    id: menuButton
    anchors.left:  parent.left; anchors.top: parent.top; anchors.bottom:  parent.bottom
    color:  colors.controls
    width: childrenRect.width + 20

    Text{
      id: buttonLabel
      text: wSettings.label
      font.family: "Segoe UI Light"
      anchors.centerIn: parent
      color: "#ffffff"
    }

    MouseArea {
      id: buttonMouseArea
      anchors.fill: parent
      hoverEnabled: true
      onEntered: parent.color = colors.hover
      onExited: parent.color = colors.controls      
    }
  }

  //Window Buttons
  Row{
    id: windowControls
    anchors.rightMargin: 10
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    spacing: 10
  
    Image {
      id: minimize
      source: "img/minimize.png"
      MouseArea {
        anchors.fill: parent
        
        hoverEnabled: true
        
        onEntered: parent.source = "img/minimizeHover.png"
        onExited: parent.source = "img/minimize.png"
        
        onClicked: controller.minimizeClicked()
      }
    }
    /*
    Image {
      id: maximize
      source: "img/maximize.png"
      MouseArea {
        anchors.fill: parent
        onClicked: controller.maximizeClicked()
      }
    }
    */

    Image{
      id: close
      source:  "img/close.png"
      MouseArea {
        anchors.fill: parent
        
        hoverEnabled: true
        
        onEntered: parent.source = "img/closeHover.png"
        onExited: parent.source = "img/close.png"
        
        onClicked: controller.closeClicked()
      }
    }
  }

  //Top Border
  Rectangle{
    id: topMargin
    anchors.right: parent.right; anchors.left: parent.left; anchors.top: parent.toptop
    height: 3
    color: colors.controls
  }
}