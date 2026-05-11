import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    width: 800
    height: 600
    color: "#111111"

    property int currentIndex: 0

    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: {
            currentIndex = (currentIndex + 1) % 4
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            width: 420
            height: 240
            fillMode: Image.PreserveAspectFit

            source: currentIndex == 0 ? "memes/sway.png" :
                    currentIndex == 1 ? "memes/calamares.png" :
                    currentIndex == 2 ? "memes/eblan.png" :
                    "memes/linux.png"
        }

        Text {
            color: "white"
            font.pixelSize: 34
            text: currentIndex == 0 ? "Настраиваем Sway..." :
                  currentIndex == 1 ? "Calamares хуярит разделы..." :
                  currentIndex == 2 ? "EBLAN MODE ACTIVATED" :
                  "Линукс момент"
        }

        Text {
            color: "#00ff99"
            font.pixelSize: 22
            text: "✔ Установка мегасистемы идёт полным ходом"
        }

        ProgressBar {
            width: 500
            from: 0
            to: 100
            value: (currentIndex + 1) * 25
        }
    }
}
