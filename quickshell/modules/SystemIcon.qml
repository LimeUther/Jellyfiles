pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.configs

Rectangle {
  id: root

  required property var icons
  required property int size

  property real progress: 1

  Layout.alignment: Qt.AlignHCenter

  implicitWidth: size
  implicitHeight: size

  radius: Config.moduleRadius
  color: Colors.surface_container_highest

  Repeater {
    id: duper
    model: 2

    Item {
      id: icon
      required property int index

      anchors.centerIn: parent
      height: parent.height
      width: parent.width

      property var curProgressIcon: root.icons[Math.round((root.icons.length - 1) *  root.progress)]
      property var maxProgressIcon: root.icons[root.icons.length - 1]

      Image {
        anchors.centerIn: parent
        id: iconImage

        source: icon.index > 0 ?
                icon.curProgressIcon.src :
                icon.maxProgressIcon.src
        height: icon.height - 7
        width:  icon.width - 7

        visible: false
      }

      MultiEffect {
        anchors.fill: iconImage
        source: iconImage

        colorization: 1
        colorizationColor: icon.index > 0 ?
                           icon.curProgressIcon.color ?? Colors.on_surface :
                           Colors.surface_container
      }
    }
  }
}
