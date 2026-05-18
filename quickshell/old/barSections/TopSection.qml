pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.configs
import qs.barModules

Rectangle {
  id: root

  property string currentHours: Qt.formatDateTime(new Date(), "hh")
  property string currentMinutes: Qt.formatDateTime(new Date(), "mm")
  property string currentMonth: Qt.formatDateTime(new Date(), "MM")
  property string currentDay: Qt.formatDateTime(new Date(), "dd")

  Layout.fillWidth: true
  color: "transparent"

  property real innerModuleRadius: 3
  property real cpuUsage: 0.3
  property real ramUsage: 0.6

  Behavior on Layout.preferredHeight {
    NumberAnimation {
      duration: 1000
      easing.type: Easing.InOutQuart
    }
  }

  property string username: ""

  Process {
    command: ["whoami"]
    running: true
    stdout: SplitParser {
      onRead: name => root.username = name
    }
  }
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
      cpuProcess.running = true;
      ramProcess.running = true;
    }
  }

  ColumnLayout {
    id: clockModule
    property bool expanded: false
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    Timer {
      interval: 60000
      running: true
      repeat: true
      onTriggered: {
        root.currentMonth = Qt.formatDateTime(new Date(), "MM");
        root.currentDay = Qt.formatDateTime(new Date(), "dd");
      }
    }
    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: {
        root.currentHours = Qt.formatDateTime(new Date(), "hh");
        root.currentMinutes = Qt.formatDateTime(new Date(), "mm");
      }
    }

    Rectangle {
      Layout.alignment: Qt.AlignHCenter
      Layout.preferredHeight: clockModule.expanded ? 80 : 45
      Behavior on Layout.preferredHeight {
        NumberAnimation {
          duration: 250
          easing.type: Easing.InOutQuad
        }
      }
      implicitWidth: 28
      radius: Config.barRadius
      color: Colors.color19

      Loader {
        id: loader
        anchors.centerIn: parent
        sourceComponent: clockModule.expanded ? dateComponent : clockComponent
      }

      Component {
        id: clockComponent
        ColumnLayout {
          anchors.centerIn: parent
          spacing: 4

          Text {
            Layout.alignment: Qt.AlignHCenter
            // text: root.currentHours
            text: root.currentHours
            color: Colors.foreground
            font.family: "FiraCode Nerd Font"
            font.weight: Font.Black
            font.pixelSize: 11
          }

          Text {
            Layout.alignment: Qt.AlignHCenter
            text: root.currentMinutes
            color: Colors.foreground
            font.family: "FiraCode Nerd Font"
            font.weight: Font.Black
            font.pixelSize: 11
          }

        }
      }
      Component {
        id: dateComponent
        ColumnLayout {
          anchors.centerIn: parent
          spacing: 4

          Text {
            Layout.alignment: Qt.AlignHCenter
            text: root.currentDay
            color: Colors.foreground
            font.family: "FiraCode Nerd Font"
            font.weight: Font.Black
            font.pixelSize: 11
          }

          Text {
            Layout.alignment: Qt.AlignHCenter
            text: root.currentMonth
            color: Colors.foreground
            font.family: "FiraCode Nerd Font"
            font.weight: Font.Black
            font.pixelSize: 11
          }
        }
      }
      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onEntered: clockModule.expanded = !clockModule.expanded
        onExited: clockModule.expanded = !clockModule.expanded
      }
    }

    VolumeControl {}
    Rectangle {
      Layout.alignment: Qt.AlignHCenter
      implicitWidth: 28
      implicitHeight: 60
      radius: Config.barRadius
      color: Colors.color19

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 2
        RadialIndicator {
          Layout.alignment: Qt.AlignHCenter
          percent: root.cpuUsage
          indicatorColor: Colors.color12
          backgroundColor: Colors.color18
          size: 24
        }
        RadialIndicator {
          Layout.alignment: Qt.AlignHCenter
          percent: root.ramUsage
          indicatorColor: Colors.color10
          backgroundColor: Colors.color18
          size: 24
        }
      }
    }
  }
}
