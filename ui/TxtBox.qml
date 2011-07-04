import Qt 4.7

Rectangle {
  id: txtBox
  
  property alias time: txtBoxVal.text
  
  signal txtChanged()

  property string labelTxt: "value"
  property string boxTxt: "value"

  property color txtColor: "#EEEEEE"
  property color boxColor: "#EEEEEE"
  property color hglColor: "#00EE00"

  property int boxLenght: 100

  color: "#00000000"

  Text {
    id: label
    anchors.top: parent.top; anchors.topMargin: 2
    text: txtBox.labelTxt
    font.pixelSize:12; font.family: "Segoe UI Light"; color: txtBox.txtColor
  }

  Rectangle{
    id: textBorder
    anchors.left: label.right; anchors.leftMargin: 5
    height: 20; width: txtBox.boxLenght
    color: "#00000000"; border.color: txtBox.boxColor

    MouseArea{
      anchors.fill: parent
      hoverEnabled: true
      onEntered: { textBorder.border.color = txtBox.hglColor  }
      onExited: {  textBorder.border.color = txtBox.boxColor  }
    }

    TextInput{
      id: txtBoxVal
      text: txtBox.boxTxt
      color: txtBox.txtColor
      font.family: "Segoe UI Light"
      horizontalAlignment: Text.AlignHCenter
      font.pointSize: 10
      anchors.fill: parent
      
          
      validator: RegExpValidator {
        regExp: /^([0-9][0-9]|[0-9]):([0-5][0-9])|([0-9][0-9]|[0-9])$/
      }
      
    onTextChanged: {
      txtBox.txtChanged()
    }
    
    }
  }
}
