pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland
import qs.configs
import qs.barModules

Rectangle {
  Layout.fillWidth: true
  color: "transparent"

  ColumnLayout {
    id: clockModule
    property bool expanded: false
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
      implicitHeight: 28
      implicitWidth: 28
      radius: Config.barRadius
      color: Colors.color19

      Text {
        anchors.centerIn: parent
        text: " "
        color: Colors.color3
        font.family: "FiraCode Nerd Font"
        font.pixelSize: 11
      }
    }
  }
}
