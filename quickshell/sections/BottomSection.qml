pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import qs.modules

Rectangle {
  id: root

  readonly property PwNode sink: Pipewire.defaultAudioSink

  property real battery: UPower.displayDevice.percentage
  property real volume: sink?.audio?.volume ?? 0
  property bool muted: sink?.audio?.muted ?? false

  PwObjectTracker {
    id: pwObjectTracker
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredHeight: 1

  color: "transparent"

  ColumnLayout {
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 6

    width: parent.width

    // Volume Module
    SystemIcon {
      icons: root.muted ? ['../assets/volume_0'] : [
        '../assets/volume_1.png',
        '../assets/volume_2.png',
        '../assets/volume_3.png'
      ]

      progress: root.volume
    }

    // Battery Module
    SystemIcon {
      icons: [
        '../assets/battery_0.png',
        '../assets/battery_1.png',
        '../assets/battery_2.png',
        '../assets/battery_3.png',
        '../assets/battery_4.png',
        '../assets/battery_5.png',
        '../assets/battery_6.png',
        '../assets/battery_7.png'
      ]

      progress: root.battery
      rotation: -90
    }

    // Power Module
    SystemIcon {
      icons: [
        '../assets/power.png',
      ]
    }
  }
}

