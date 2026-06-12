pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import Quickshell.Io
import qs.modules
import qs.configs

Rectangle {
  id: root

  readonly property PwNode sink: Pipewire.defaultAudioSink

  property real battery: UPower.displayDevice?.percentage ?? 0
  property real volume: sink?.audio?.volume ?? 0
  property real signal: 0
  property bool muted: sink?.audio?.muted ?? false

  PwObjectTracker {
    id: pwObjectTracker
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  Process {
    id: signalStrengthProcess
    command: [
      "sh",
      "-c",
      "nmcli -t -f ACTIVE,SIGNAL dev wifi | grep '^yes' | cut -d: -f2"
    ]
    running: false

    stdout: SplitParser {
      onRead: data => {
        var signal = parseInt(data.trim())/100 || 0
        root.signal = signal
      }
    }
  }

  Timer {
    interval: 3000
    running: true
    repeat: true
    triggeredOnStart: true

    onTriggered: {
      signalStrengthProcess.running = true
    }
  }

  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredHeight: 1

  color: "transparent"

  ColumnLayout {
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 6

    width: parent.width

    Rectangle {
      id: workspaces
      Layout.alignment: Qt.AlignHCenter

      implicitWidth: parent.width - 11
      implicitHeight: childrenRect.height + 5

      radius: Config.moduleRadius
      color: Colors.surface_container_highest

      ColumnLayout {
        anchors.centerIn: parent
        spacing: 0


        // Wifi Module
        SystemIcon {
          icons: [
            { src: '../assets/none.png' },
            { src: '../assets/wifi_0.png' },
            { src: '../assets/wifi_1.png' },
            { src: '../assets/wifi_2.png' },
          ]

          size: root.width - 11
          progress: root.signal
        }

        // Volume Module
        SystemIcon {
          icons: root.muted ? [{ src: '../assets/volume_0'}] : [
            { src: '../assets/volume_1.png' },
            { src: '../assets/volume_2.png' },
            { src: '../assets/volume_3.png' },
          ]

          size: root.width - 11
          progress: root.volume
        }

        // Battery Module
        SystemIcon {
          icons: [
            { src: '../assets/battery_0.png', color: Colors.error },
            { src: '../assets/battery_1.png', color: Colors.error },
            { src: '../assets/battery_2.png' },
            { src: '../assets/battery_3.png' },
            { src: '../assets/battery_4.png' },
            { src: '../assets/battery_5.png' },
            { src: '../assets/battery_6.png' },
            { src: '../assets/battery_7.png' },
          ]

          size: root.width - 11
          progress: root.battery
          rotation: -90
        }
      }
    }

    // Power Module
    SystemIcon {
      icons: [
        { src: '../assets/power.png', color: Colors.error },
      ]
      size: root.width - 11
    }
  }
}

