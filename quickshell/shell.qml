import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.configs
import qs.sections

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    delegate: Component {
      // qmllint disable uncreatable-type
      WlrLayershell {
        id: barRoot
        namespace: "taskbar"

        required property var modelData
        screen: modelData

        anchors {
          top: true
          left: true
          bottom: true
        }

        margins {
          left: Config.barMarginLeft
          right: Config.barMarginRight
          top: Config.barMarginTop
          bottom: Config.barMarginBottom
        }

        implicitWidth: Config.barWidth
        color: "transparent"

        Rectangle {
          color: Qt.rgba(
            Colors.background.r,
            Colors.background.g,
            Colors.background.b,
            0.8
          )

          anchors {
            top: parent.top
            bottom: parent.bottom
          }

          implicitWidth: parent.width
          radius: Config.barRadius

          ColumnLayout {
            anchors {
              top: parent.top
              bottom: parent.bottom
              left: parent.left
              right: parent.right
            }

            TopSection{}
            CenterSection{}
            BottomSection{}
          }
        }
      }
    }
  }
}
