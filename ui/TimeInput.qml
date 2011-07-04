import QtQuick 1.0
Rectangle {
    id: timeInput
    width: 100
    height: parent.height
    color: "#00000000"
    border.color: colors.text

    TextInput {
        id: text_input1

        text: "25:00"
        horizontalAlignment: TextInput.AlignHCenter
        font.pixelSize: 20
        font.family: "Segoe UI Light"
        anchors.margins: 5
        anchors.fill: parent
        color: colors.text
    }
}
