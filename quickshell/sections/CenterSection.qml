pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.configs

Rectangle {
  id: root

  property real batteryPercentage
  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredHeight: 1

  color: "transparent"

  ColumnLayout {
    anchors.centerIn: parent

    width: parent.width

    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      implicitWidth: parent.width - 11
      implicitHeight: parent.width - 11

      radius: Config.moduleRadius
      color: Colors.color19

      Text {
        text: Hyprland.focusedWorkspace.name
        color: Colors.color1
        font.family: "FiraCode Nerd Font"
        font.pixelSize: 13
        anchors.centerIn: parent
      }
    }
  }
}

