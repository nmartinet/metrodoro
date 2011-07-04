import QtQuick 1.0

Rectangle{
  id: settings
  anchors.fill: parent
    
  color: colors.bg
  
  TxtBox{
    id: workTime
    anchors.top: parent.top
    anchors.topMargin: 5
    anchors.left: parent.left
    anchors.leftMargin: 5
    
    labelTxt: "Work Time"
    boxTxt: "25:00"
    
    txtColor: colors.text
    boxColor: colors.text
    hglColor: colors.controls

    onTxtChanged: {
      controller.workTimeChange(workTime.time)
    
    }
    
  }

  TxtBox{
    id: restTime
    
    anchors.top: parent.top
    anchors.topMargin: 30
    
    anchors.left: parent.left
    anchors.leftMargin: 5
    
    labelTxt: "Rest Time"
    boxTxt: "5:00"
    
    txtColor: colors.text
    boxColor: colors.text
    hglColor: colors.controls
    
    onTxtChanged: {
      controller.restTimeChange(restTime.time)
    }
  }
}