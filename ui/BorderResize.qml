import QtQuick 1.0

Flow {
  id: borderResize

  property variant bSize: 10
  property variant minWidth: 200
  property variant minHeight: 200
    
  anchors.fill: parent
  anchors.margins: 5

  
  //top left
  MouseArea{
    width: parent.bSize
    height: parent.bSize
    
    hoverEnabled: true
    onEntered: controller.changePointer("fdiag")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false  
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                
        if(mainwindow.size.width-delta.x >= parent.minWidth){
          mainwindow.pos = Qt.point(mainwindow.pos.x+delta.x, mainwindow.pos.y) 
          mainwindow.size = Qt.size(mainwindow.size.width-delta.x, mainwindow.size.height)
        }
        
        if(mainwindow.size.height-delta.y >= parent.minHeight){
          mainwindow.pos = Qt.point(mainwindow.pos.x, mainwindow.pos.y+delta.y) 
          mainwindow.size = Qt.size(mainwindow.size.width, mainwindow.size.height-delta.y)
        }       
      }       
    }
  }
  
  //top
  MouseArea{
    width: parent.width - parent.bSize*2
    height: parent.bSize
    hoverEnabled: true
    onEntered: controller.changePointer("ver")
    onExited:  controller.changePointer("norm")
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        
        if(mainwindow.size.height-delta.y >= parent.minHeight){
          mainwindow.pos = Qt.point(mainwindow.pos.x, mainwindow.pos.y+delta.y) 
          mainwindow.size = Qt.size(mainwindow.size.width, mainwindow.size.height-delta.y)
        }
      }       
    }
  }
  
  //top right
  MouseArea{
    width: parent.bSize
    height: parent.bSize
    hoverEnabled: true
    onEntered: controller.changePointer("bdiag")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false
    
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        
        if(mainwindow.size.width+delta.x >= parent.minWidth){
          mainwindow.size = Qt.size(mainwindow.size.width+delta.x, mainwindow.size.height)
        }
        
        if(mainwindow.size.height-delta.y >= parent.minHeight){
          mainwindow.pos = Qt.point(mainwindow.pos.x, mainwindow.pos.y+delta.y) 
          mainwindow.size = Qt.size(mainwindow.size.width, mainwindow.size.height-delta.y)
        }         
      }       
    }
  }
    
  //left
  MouseArea{
    width: parent.bSize
    height: parent.height - parent.bSize*2
    hoverEnabled: true
    onEntered: controller.changePointer("hor")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        
        
        if(mainwindow.size.width-delta.x >= parent.minWidth){
          mainwindow.pos = Qt.point(mainwindow.pos.x+delta.x, mainwindow.pos.y) 
          mainwindow.size = Qt.size(mainwindow.size.width - delta.x, mainwindow.size.height)   
        }  
      }       
    } 
  }
    
  //padding
  Rectangle{
    width: parent.width - parent.bSize*2
    height: parent.height - parent.bSize*2
    color: "#00000000"
  }
  
  //right
  MouseArea{
    width: parent.bSize
    height: parent.height - parent.bSize*2
    hoverEnabled: true
    onEntered: controller.changePointer("hor")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        if(mainwindow.size.width+delta.x >= parent.minWidth){
          mainwindow.size = Qt.size(mainwindow.size.width + delta.x, mainwindow.size.height)
        }
      }       
    }    
  }
  
  //bottom left
  MouseArea{
    width: parent.bSize
    height: parent.bSize
    hoverEnabled: true
    onEntered: controller.changePointer("bdiag")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false

    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        
        if(mainwindow.size.width-delta.x >= parent.minWidth){
          mainwindow.pos = Qt.point(mainwindow.pos.x+delta.x, mainwindow.pos.y) 
          mainwindow.size = Qt.size(mainwindow.size.width-delta.x, mainwindow.size.height)   
        }
        
        if(mainwindow.size.height+delta.y >= parent.minHeight){
          mainwindow.size = Qt.size(mainwindow.size.width, mainwindow.size.height+delta.y)   
        } 
      }       
    }
  }
  
  //bottom
  MouseArea{
    width: parent.width - parent.bSize*2
    height: parent.bSize
    hoverEnabled: true
    onEntered: controller.changePointer("ver")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        
        if(mainwindow.size.height+delta.y >= parent.minHeight){
          mainwindow.size = Qt.size(mainwindow.size.width, mainwindow.size.height+delta.y)
        }          
      }       
    }
  }
  
  //bottom right
  MouseArea{
    width: parent.bSize
    height: parent.bSize
    hoverEnabled: true
    onEntered: controller.changePointer("fdiag")
    onExited:  controller.changePointer("norm")
    
    property variant clickPos: "1,1"
    property bool pressed: false
    
    onPressed:  pressed = true
    onReleased: pressed = false
    onPositionChanged: {
      if(pressed){
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        
        if(mainwindow.size.width+delta.x >= parent.minWidth){
          mainwindow.size = Qt.size(mainwindow.size.width+delta.x, mainwindow.size.height)
        }
        
        if(mainwindow.size.height+delta.y >= parent.minHeight){
          mainwindow.size = Qt.size(mainwindow.size.width, mainwindow.size.height+delta.y)  
        } 
        
        
      }       
    }
  }
}
