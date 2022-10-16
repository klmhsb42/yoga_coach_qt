import QtQuick 2.7
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {
    id: settingsPage
    title: "Settings"

    //Colors
    property string frontColor:     "#000000"  // or "#000000" format
    property string backColor:      "#CFCFCF"    // or "#000000" format
    property string detailsColor:   "#949494"      // or "#000000" format
    property string accentColor:    "#CFCFCF"    // or "#000000" format

    //Properties
    property string iconAppRute: "../assets/logo.svg"
    property string version: "0.0.1"  //version as a string (between inverted commas)
    property string license: "<a href='https://opensource.org/licenses/MIT'>MIT</a>"
                             //"<a href='http://www.gnu.org/licenses/gpl-3.0.en.html'>GPL3</a>"
                             //"<a href='https://opensource.org/licenses/MIT'>MIT</a>"
                             //"<a href='https://creativecommons.org/licenses/by-sa/4.0/'>CC By-SA</a>"
                             //etc

    header: PageHeader {
        id: pageHeader
        title: i18n.tr("Settings")

        StyleHints {
            foregroundColor: frontColor
            backgroundColor: backColor
            dividerColor: detailsColor
        }
    }


    /*
    ScrollView {
        width: parent.width
        height: parent.height
        contentItem: aboutView
    }

    ListView {
        id: aboutView
        anchors.fill: parent
        section.property: "category"
        section.criteria: ViewSection.FullString

        Item {
            id: test
            Text {
                id: texttest
                text: qsTr("text")
            }
        }

    }


*/



Column {
    id: configuration
    anchors.fill: parent
    anchors.top: header.bottom



    ListItem.Standard {
        text: i18n.tr("Record the exercise?")
        enabled: true
        control: Switch {
            id: enablevideorecord
            checked: settings.videorecord
            onClicked: {
                if(settings.videorecord)
                    settings.videorecord = false
                else
                    settings.videorecord = true
            }
        }
    }




}

}
