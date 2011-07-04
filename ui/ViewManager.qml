import QtQuick 1.0

Rectangle{
  id: viewManager

  clip: true

  property int currentView: 0
  signal showTab(int t)


  Component.onCompleted:{
    for(var i = 0; i < viewManager.children.length; i++){
      viewManager.children[i].visible = false
    }
    viewManager.children[currentView].visible = true
  }

  onShowTab:{

    viewManager.children[currentView].visible = false
    viewManager.children[t].visible = true

    currentView = t
  }


}
