import QtQuick 1.0

Rectangle{
  id: main
  
  color: colors.bg
  
  
  
  
  Rectangle{
    width: parent.width
    height: parent.height - 48
    color: colors.bg
    
    Text{
      id: timeStatus
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.topMargin: 5
      anchors.leftMargin: 5
      text: m.timeStatus
      font.family: "Segoe UI Light"
      font.pointSize: 14
      color: "#ffffff"
      Connections{
        target: m
        onTimeStatusChanged: {timeStatus.text = m.timeStatus}  
      }
      
    }
    
    
    
    
    Text{
      id: timeLabel
      anchors.centerIn: parent
      text: m.text
      font.family: "Segoe UI Light"; font.pointSize: 75; color: "#ffffff"

      Connections{
        target: m
        onTextChanged: {timeLabel.text = m.text}
      }
      
    }
  }
  
  Row{
    spacing: 10
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    Image {
      id: start
      source: "img/play.png" 
      MouseArea {anchors.fill: parent; onClicked: controller.start()}
    }
    
    Image {
      id: pause
      source: "img/pause.png"
      MouseArea {anchors.fill: parent; onClicked: controller.pause()}
    }
    
    Image {
      id: restart
      source: "img/back.png"
      MouseArea {anchors.fill: parent; onClicked: controller.restart()}
    }               
  }

  
}




