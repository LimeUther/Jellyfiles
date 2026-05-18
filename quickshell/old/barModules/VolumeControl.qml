import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import qs.configs

Rectangle {
  id: root

  Layout.alignment: Qt.AlignHCenter
  implicitWidth: 28
  implicitHeight: 83
  radius: Config.barRadius
  color: Colors.color19

  readonly property PwNode sink: Pipewire.defaultAudioSink

  property bool muted: sink?.audio?.muted ?? false
  property real volume: sink?.audio?.volume ?? 0
  property real currentVolume: 0.5
  property real lastVolume: 0

  PwObjectTracker {
    id: pwObjectTracker
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  SequentialAnimation {
    id: bounceAnimation
    PropertyAnimation {
      target: volumeBar
      property: "anchors.bottomMargin"
      to: -8
      duration: 120
      easing.type: Easing.OutBack
    }
    PropertyAnimation {
      target: volumeBar
      property: "anchors.bottomMargin"
      to: 10
      duration: 180
      easing.type: Easing.InOutBounce
    }
    PropertyAnimation {
      target: volumeBar
      property: "anchors.bottomMargin"
      to: -4
      duration: 140
      easing.type: Easing.OutBounce
    }
    PropertyAnimation {
      target: volumeBar
      property: "anchors.bottomMargin"
      to: 6
      duration: 100
      easing.type: Easing.InOutQuad
    }
    PropertyAnimation {
      target: volumeBar
      property: "anchors.bottomMargin"
      to: 0
      duration: 160
      easing.type: Easing.OutElastic
    }
  }

  onVolumeChanged: {
    if (Math.abs(volume - lastVolume) > 0.01) {
      bounceAnimation.start();
      lastVolume = volume;
    }
  }

  ColumnLayout {
    anchors.centerIn: parent
    spacing: 6

    Rectangle {
      Layout.alignment: Qt.AlignHCenter
      implicitWidth: 14
      implicitHeight: 14
      color: 'transparent'

      Text {
        anchors.centerIn: parent
        text: " "
        color: Colors.color3
        font.family: "FiraCode Nerd Font"
        font.pixelSize: 11
      }
    }

    Rectangle {
      id: volumeBar
      Layout.alignment: Qt.AlignHCenter
      Layout.bottomMargin: 4
      implicitWidth: 8
      implicitHeight: 46
      color: Colors.color18
      radius: 2

      Rectangle {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: root.muted ? 0 : parent.height * root.volume
        radius: 1
        gradient: Gradient {
          orientation: Gradient.Vertical
          GradientStop {
            position: 0
            color: Colors.color3
          }
          GradientStop {
            position: 1
            color: Colors.color11
          }
        }

        Behavior on height {
          NumberAnimation {
            duration: 150
            easing.type: Easing.OutCubic
          }
        }
      }
    }
  }

  MouseArea {
    anchors.fill: parent

    onClicked: {
      root.sink.audio.muted = !root.muted;
    }

    onWheel: wheel => {
      if (root.sink && !root.muted) {
        let delta = wheel.angleDelta.y > 0 ? 0.1 : -0.1;
        let newVolume = root.volume + delta;
        newVolume = Math.max(0, Math.min(1, newVolume));
        root.sink.audio.volume = newVolume
      }
    }
  }
}
