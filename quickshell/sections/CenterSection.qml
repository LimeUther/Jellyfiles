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
      id: workspaces
      Layout.alignment: Qt.AlignHCenter

      implicitWidth: parent.width - 11
      implicitHeight: childrenRect.height

      radius: Config.moduleRadius
      color: Colors.surface_container_highest

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        Repeater {
          model: Hyprland.workspaces.values.filter(ws => ws.id >= 0)

          Rectangle {
            required property int index
            required property var modelData

            property bool isWindowed: modelData.toplevels.values.length > 0
            property bool isFocused: modelData.focused

            Layout.alignment: Qt.AlignHCenter
            implicitWidth: parent.parent.width
            implicitHeight: parent.parent.width

            radius: Config.moduleRadius
            color: isFocused ? Colors.primary : "transparent"

            Text {
              anchors.centerIn: parent
              text: parent.modelData.id
              color: parent.isFocused ? Colors.surface_container_high :
                     parent.isWindowed ? Colors.on_surface : Colors.surface_container
              font.family: "FiraCode Nerd Font"
              font.weight: Font.Black
              font.pixelSize: 12
            }
          }
        }
      }
    }
  }
}

