import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1191
    height: 731
    title: "MainWindow"

    property real sensor1Value: 0.5 // Nilai default sensor 1 (0 - 1 range)
    property real sensor2Value: 0.3 // Nilai default sensor 2 (0 - 1 range)
    
    property real marker1Pos: parent.height * sensor1Value // Posisi penanda sensor 1
    property real marker2Pos: parent.height * sensor2Value // Posisi penanda sensor 2

    Timer {
        id: timer
        interval: 1000 // Interval waktu dalam milidetik (1 detik)
        running: true
        repeat: true

        onTriggered: {
            // Generate random values for sensors
            sensor1Value = Math.random() // Nilai random antara 0 - 1 untuk sensor 1
            sensor2Value = Math.random() // Nilai random antara 0 - 1 untuk sensor 2
            marker1Pos = parent.height * sensor1Value // Perbarui posisi penanda sensor 1
            marker2Pos = parent.height * sensor2Value // Perbarui posisi penanda sensor 2
        }
    }

    Item {
        width: parent.width
        height: parent.height

        Text {
            id: text
            text: "Kelompok 2"
            font.pixelSize: 24
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 20 // Margin from the top
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            text: "On/Off"
            anchors {
                top: parent.top
                right: parent.right
                topMargin: 20 // Margin from the top
                rightMargin: 20 // Margin from the right
            }
            onClicked: {
                // Handle on/off button click
            }
        }

        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right // Menempatkan di sebelah kanan
                rightMargin: 20 // Margin dari sisi kanan
            }

            Rectangle {
                width: 10 // Lebar sensor
                height: parent.height * sensor1Value // Tinggi berdasarkan nilai sensor 1
                color: "blue" // Warna untuk sensor 1
                
                Rectangle {
                    width: 20 // Lebar penanda
                    height: 20 // Tinggi penanda
                    color: "yellow" // Warna penanda
                    anchors {
                        bottom: parent.bottom // Penanda berada di bagian bawah sensor
                        horizontalCenter: parent.horizontalCenter // Penanda di tengah sensor
                        bottomMargin: marker1Pos * -1 // Posisi penanda berdasarkan sensor
                    }
                }
            }
            
            Rectangle {
                Layout.fillWidth: true // Spacer
            }

            Rectangle {
                width: 10 // Lebar sensor
                height: parent.height * sensor2Value // Tinggi berdasarkan nilai sensor 2
                color: "red" // Warna untuk sensor 2
                
                Rectangle {
                    width: 20 // Lebar penanda
                    height: 20 // Tinggi penanda
                    color: "yellow" // Warna penanda
                    anchors {
                        bottom: parent.bottom // Penanda berada di bagian bawah sensor
                        horizontalCenter: parent.horizontalCenter // Penanda di tengah sensor
                        bottomMargin: marker2Pos * -1 // Posisi penanda berdasarkan sensor
                    }
                }
            }
        }

        ColumnLayout {
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 60 // Menambah jarak dari tombol Simpan
            }
            spacing: 20 // Jarak antar elemen

            Slider {
                id: slider1
                from: 0
                to: 100
                value: 50
                Layout.fillWidth: true
                Layout.preferredHeight: 30 // Tinggi slider
                // ... event handling
            }

            Slider {
                id: slider2
                from: 0
                to: 100
                value: 30
                Layout.fillWidth: true
                Layout.preferredHeight: 30 // Tinggi slider
                // ... event handling
            }

            Slider {
                id: slider3
                from: 0
                to: 100
                value: 70
                Layout.fillWidth: true
                Layout.preferredHeight: 30 // Tinggi slider
                // ... event handling
            }

            Slider {
                id: slider4
                from: 0
                to: 100
                value: 40
                Layout.fillWidth: true
                Layout.preferredHeight: 30 // Tinggi slider
                // ... event handling
            }
        }

        Button {
            text: "Simpan"
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 20 // Margin from the bottom
            }
            onClicked: {
                // Handle save button click
            }
        }
    }
}

