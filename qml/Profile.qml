import QtQuick 2.7
import Ubuntu.Components 1.3
//import Ubuntu.Components.Popups 1.3
//import Ubuntu.Components.ListItems 1.3 as ListItem
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    id: aboutPage
    property int showDebug

    property string frontColor:     "#000000"  // or "#000000" format
    property string backColor:      "#CFCFCF"    // or "#000000" format
    property string detailsColor:   "#949494"      // or "#000000" format
    property string accentColor:    "#CFCFCF"    // or "#000000" format

    header: PageHeader {
      title: i18n.tr("Profile")

        StyleHints {
            foregroundColor: frontColor
            backgroundColor: backColor
            dividerColor: detailsColor
        }
    }

    Rectangle {
        anchors.top: header.bottom
        width: 800;
        height: 600

        ColumnLayout {
            width: 200
            anchors.centerIn: parent
            spacing: 25

            TextField {
                placeholderText: qsTr("User name")
                Layout.fillWidth: true
            }
            TextField {
                placeholderText: qsTr("Password")
                Layout.fillWidth: true
                echoMode: TextInput.Password
            }
            RowLayout {
                Button {
                    text: "Log In"
                    Layout.fillWidth: true
                }

                Button {
                    text: "Cancel"
                    Layout.fillWidth: true
                }
            }
        }
    }

}
