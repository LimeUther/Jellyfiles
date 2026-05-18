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
  anchors.centerIn: parent

  ColumnLayout {
    id: clockModule
    property bool expanded: false
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
      implicitHeight: childrenRect.height + 34
      implicitWidth: 28
      radius: Config.barRadius
      color: Colors.color19

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 3

        ColumnLayout {
          spacing: 3

          Repeater {
            model: Hyprland.workspaces

            Rectangle {
              required property var modelData

              width: 4
              Layout.preferredHeight: modelData.active ? 36 : 12
            }
          }
        }
      }
    }
  }
}
