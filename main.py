#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys, threading, time
from PySide import QtCore, QtGui, QtDeclarative

class Controller(QtCore.QObject):
  @QtCore.Slot()
  def minimizeClicked(self):
    view.showMinimized()
  
  @QtCore.Slot()
  def closeClicked(self):
    model.stop()
    app.quit()
  
  @QtCore.Slot()
  def start(self):
    model.start()
  
  @QtCore.Slot()
  def pause(self):
    model.pause()
  
  @QtCore.Slot()
  def restart(self):
    model.restart()
  
  @QtCore.Slot()
  def stop(self):
    model.stop()
  
  @QtCore.Slot(str)
  def workTimeChange(self, s):
    pass
  
  @QtCore.Slot(str)
  def restTimeChange(self, s):
    pass
  
  @QtCore.Slot(str)
  def changePointer(self, s):
    if s == "norm":
      app.setOverrideCursor(QtCore.Qt.ArrowCursor)
    elif s == "hor":
      app.setOverrideCursor(QtCore.Qt.SizeHorCursor)
    elif s == "ver":
      app.setOverrideCursor(QtCore.Qt.SizeVerCursor)
    elif s == "bdiag":
      app.setOverrideCursor(QtCore.Qt.SizeBDiagCursor)
    elif s == "fdiag":
      app.setOverrideCursor(QtCore.Qt.SizeFDiagCursor)
  



class Pomodoro(QtCore.QThread):
  def __init__(self):
    super(Pomodoro, self).__init__()
    self._work = True
    self._running  = False
    self._workTime = 1500
    self._restTime = 300
    self._timeLeft = self._workTime
    self._text = ""
    self._timeStatus = "Work"
    self._alert = QtGui.QSound("alarm.wav")
    self.setText()
    
  def run(self):
    self._running = True
    
    while self._running:
      while self._timeLeft >= 0 & self._running:
        self.sleep(1)
        self.setText()
        self.textChanged.emit()
        self._timeLeft += -1
        
      if self._work:
        self._timeLeft = self._restTime
        self._timeStatus = "Rest"
      else:
        self._timeLeft = self._workTime
        self._timeStatus = "Work"
      self._alert.play()
      self.sleep(10)
      self.timeStatusChanged.emit()
      self._work = not self._work
  
  def stop(self):
    self._running = False
    self._timeLeft = self._workTime
    self.terminate()
  
  def pause(self):
    self._running = False
    self.terminate()
  
  def restart(self):
    self._timeLeft = self._workTime
  
  def getText(self):
    return str(self._text)
  
  def setText(self):
      format = ""
      if self._timeLeft <= 60:
        format = "00:%(s)02d" %{'s': self._timeLeft}
      else:
        m = self._timeLeft/60
        s = self._timeLeft%60
        format= '%(m)02d:%(s)02d' %{'m':m, 's':s}
      self._text = format
  
  def getTimeStatus(self):
    return self._timeStatus
  
  def setTimeStatus(self):
    pass
  
  textChanged = QtCore.Signal()
  timeStatusChanged = QtCore.Signal()
  text = QtCore.Property(str, getText, setText, notify=textChanged)
  timeStatus = QtCore.Property(str, getTimeStatus, setTimeStatus, notify=timeStatusChanged)

ColorConstants = {
  "bg" :        "#111111",
  "controls" :  "#74A3B0",
  "hover" :     "#567780",
  "text" :      "#666666",
  "textHover" : "#AAAAAA",
}
WindowSettings = {
  "width" :     350,
  "height" :    200,
  "resize" :    True,
  "minimize" :  True,
  "maximize" :  True,
  "label" :     "Metrodoro"
}

app = QtGui.QApplication(sys.argv)
view = QtDeclarative.QDeclarativeView()
view.setResizeMode(QtDeclarative.QDeclarativeView.SizeRootObjectToView)

controller = Controller()
model = Pomodoro()

ctx = view.rootContext()
ctx.setContextProperty('mainwindow', view)
ctx.setContextProperty('colors', ColorConstants)
ctx.setContextProperty('controller', controller)
ctx.setContextProperty('wSettings', WindowSettings)
ctx.setContextProperty('m', model)

view.setWindowFlags(QtCore.Qt.FramelessWindowHint )

view.setAttribute(QtCore.Qt.WA_TranslucentBackground )
view.setStyleSheet("background:transparent;")


url = QtCore.QUrl('./ui/window.qml')

app.setWindowIcon(QtGui.QIcon("bad.svg"))

view.setSource(url)
view.show()
# Enter Qt main loop
sys.exit(app.exec_())

