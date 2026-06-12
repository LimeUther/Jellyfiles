pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.configs
import qs.modules

Rectangle {
  id: root

  property string currentTime: Qt.formatDateTime(new Date(), "hh\nmm")
  property string currentDay:  Qt.formatDateTime(new Date(), "dd")
  property string currentWDay: Qt.formatDateTime(new Date(), "ddd")

  property real cpuUsage: 3
  property real ramUsage: 6

  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredHeight: 1

  color: "transparent"

  Process {
    id: cpuProcess
    command: [
      "sh",
      "-c",
      "top -bn1 | grep '%Cpu(s)' | awk '{print $2}' | sed 's/%us,//'"
    ]
    running: true

    stdout: SplitParser {
      onRead: data => {
        let usage = parseInt(data.trim());
        if (!isNaN(usage)) root.cpuUsage = Math.round(usage);
      }
    }
  }

  Process {
    id: ramProcess
    command: [
      "sh",
      "-c",
      "free | grep Mem: | awk '{printf \"%.0f\", ($2-$7)/$2*100}'"
    ]
    running: true

    stdout: SplitParser {
      onRead: data => {
        let usage = parseInt(data.trim());
        if (!isNaN(usage)) root.ramUsage = usage;
      }
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      root.currentTime = Qt.formatDateTime(new Date(), "hh\nmm")
      cpuProcess.running = true;
      ramProcess.running = true;
    }
  }
  Timer {
    interval: 60000
    running: true
    repeat: true
    onTriggered: {
      root.currentDay = Qt.formatDateTime(new Date(), "dd")
      root.currentWDay = Qt.formatDateTime(new Date(), "ddd")
    }
  }

  ColumnLayout {
    anchors.top: parent.top
    anchors.topMargin: 6

    width: parent.width

    // Clock & Date Module
    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      implicitHeight: childrenRect.height + 10
      implicitWidth: parent.width - 11

      color: Colors.surface_container_highest
      radius: Config.moduleRadius

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        Text {
          Layout.alignment: Qt.AlignHCenter
          text: root.currentTime
          color: Colors.on_surface
          font.family: "FiraCode Nerd Font"
          font.weight: Font.Black
          font.pixelSize: 12
        }
        Text {
          Layout.alignment: Qt.AlignHCenter
          text: "───"
          color: Colors.surface_tint
          font.family: "FiraCode Nerd Font"
          font.pixelSize: 8
        }
        Text {
          Layout.alignment: Qt.AlignHCenter
          text: root.currentWDay
          color: Colors.on_surface
          font.family: "FiraCode Nerd Font"
          font.weight: Font.Black
          font.pixelSize: 9
        }
        Text {
          Layout.alignment: Qt.AlignHCenter
          text: root.currentDay
          color: Colors.on_surface
          font.family: "FiraCode Nerd Font"
          font.weight: Font.Black
          font.pixelSize: 12
        }
      }
    }

    // RAM & CPU Module
    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      implicitHeight: childrenRect.height + 10
      implicitWidth: parent.width - 11

      color: Colors.surface_container_highest
      radius: Config.moduleRadius

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 5

        RadialIndicator {
          Layout.alignment: Qt.AlignHCenter
          percent: root.cpuUsage
          size: 22
          indicatorColor: Colors.primary
          backgroundColor: Colors.surface_container
        }

        RadialIndicator {
          Layout.alignment: Qt.AlignHCenter
          percent: root.ramUsage
          size: 22
          indicatorColor: Colors.tertiary
          backgroundColor: Colors.surface_container
        }
      }
    }
  }
}

