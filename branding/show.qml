import QtQuick 2.0
import QtQuick.Controls 2.15
import io.calamares.ui 1.0

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

            source: currentIndex == 0 ? "memes/step1.png" :
                    currentIndex == 1 ? "memes/step2.png" :
                    currentIndex == 2 ? "memes/step3.png" :
                    "memes/step4.png"
        }

        Text {
            color: "white"
            font.pixelSize: 34
            text: currentIndex == 0 ? "привет как дела" :
                  currentIndex == 1 ? "ахаха мемчик" :
                  currentIndex == 2 ? "sudo rm -rf /*" :
                  "почти готово"
        }

        Text {
            color: "#00ff99"
            font.pixelSize: 22
            text: "Установка EBLAN OS..."
        }

        ProgressBar {
            width: 500
            from: 0
            to: 1
            value: ViewManager.globalStorage.value("installationProgress") || 0
        }
    }
}
