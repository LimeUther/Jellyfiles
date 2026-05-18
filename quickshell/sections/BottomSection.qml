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

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      root.battery = UPower.displayDevice.percentage
    }
  }
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
      color: Colors.color19

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        Text {
          Layout.alignment: Qt.AlignHCenter
          text: Math.round(root.battery * 100) + "%"
          color: Colors.foreground
          font.family: "FiraCode Nerd Font"
          font.weight: Font.Black
          font.pixelSize: 9
        }
        Text {
          Layout.alignment: Qt.AlignHCenter
          text: ""
          font.pixelSize: 2
        }

        Rectangle {
          Layout.alignment: Qt.AlignHCenter
          implicitWidth: 7
          implicitHeight: 3

          color: (root.battery == 1) ? Colors.color10 : Colors.color18
        }

        Rectangle {
          Layout.alignment: Qt.AlignHCenter
          implicitWidth: 13
          implicitHeight: 25
          radius: Config.moduleRadius

          color: Colors.color18

          Rectangle {
            anchors.bottom: parent.bottom

            implicitWidth: parent.width
            implicitHeight: parent.height * root.battery
            radius: Config.moduleRadius

            color: Colors.color10
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
      color: Colors.color19

      Text {
        text: "⏻"
        color: Colors.color1
        font.family: "FiraCode Nerd Font"
        font.pixelSize: 13
        anchors.centerIn: parent
      }
    }
  }
}

