pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs.configs

Rectangle {
  id: root

  property real battery: UPower.displayDevice.percentage

  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredHeight: 1

  color: "transparent"

  ColumnLayout {
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 6

    width: parent.width

    // Battery Module
    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      implicitWidth: parent.width - 11
      implicitHeight: childrenRect.height + 10

      radius: Config.moduleRadius
      color: Colors.surface_container_highest

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        // Text {
        //   Layout.alignment: Qt.AlignHCenter
        //   text: Math.round(root.battery * 100) + "%"
        //   color: Colors.on_surface
        //   font.family: "FiraCode Nerd Font"
        //   font.weight: Font.Black
        //   font.pixelSize: 9
        // }
        // Text {
        //   Layout.alignment: Qt.AlignHCenter
        //   text: ""
        //   font.pixelSize: 2
        // }

        Rectangle {
          Layout.alignment: Qt.AlignHCenter
          implicitWidth: 5
          implicitHeight: 2

          color: (root.battery == 1) ? Colors.tertiary : Colors.surface_container_lowest
        }

        Rectangle {
          Layout.alignment: Qt.AlignHCenter
          implicitWidth: 11
          implicitHeight: 18
          radius: 2

          color: Colors.surface_container_lowest

          Rectangle {
            anchors.bottom: parent.bottom

            implicitWidth: parent.width
            implicitHeight: parent.height * root.battery
            radius: 2

            color: Colors.tertiary
          }
        }
      }
    }

    // Power Module
    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      implicitWidth: parent.width - 11
      implicitHeight: parent.width - 11

      radius: Config.moduleRadius
      color: Colors.surface_container_highest

      Text {
        text: "⏻"
        color: Colors.error
        font.family: "FiraCode Nerd Font"
        font.pixelSize: 13
        anchors.centerIn: parent
      }
    }
  }
}

