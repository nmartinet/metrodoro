import QtQuick 1.0

Rectangle {
  id: container
      
  width: wSettings.width
  height: wSettings.height
  color: "#00000000"

  ShadowRectangle {
    anchors.fill: parent
    anchors.margins: 7
    color: colors.bg
    
    TitleBar{
      id: titleBar
    }
    
    Main{
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      anchors.top:titleBar.bottom
    }  
  }  
}