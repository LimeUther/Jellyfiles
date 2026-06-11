pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.configs

Rectangle {
  id: root

  required property var icons
  property real progress: 1

  Layout.alignment: Qt.AlignHCenter

  implicitWidth: parent.width - 11
  implicitHeight: parent.width - 11

  radius: Config.moduleRadius
  color: Colors.surface_container_highest

  Repeater {
    id: duper
    model: 2

    Item {
      required property int index

      anchors.centerIn: parent
      height: parent.height
      width: parent.width

      Image {
        anchors.centerIn: parent
        id: iconImage

        source: parent.index > 0 ? root.icons[Math.round((root.icons.length - 1) *  root.progress)] : root.icons[root.icons.length - 1]
        height: parent.height - 7
        width:  parent.width - 7

        visible: false
      }

      MultiEffect {
        anchors.fill: iconImage
        source: iconImage

        colorization: 1
        colorizationColor: parent.index > 0 ? Colors.on_surface : Colors.surface_container_high
      }
    }
  }
}
