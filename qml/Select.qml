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
      title: i18n.tr("Select")
      //flickable: flickable
        StyleHints {
            foregroundColor: frontColor
            backgroundColor: backColor
            dividerColor: detailsColor
        }
    }
/*
    Rectangle {
        height: units.gu(24)
    }

    */

    ScrollView {
        anchors.top: header.bottom

        width: 400
        height: 400


    Rectangle {



        implicitWidth: grid.implicitWidth
        implicitHeight: grid.implicitHeight
        color: '#EEE'

        ComboBox {
            currentIndex: 0
            textRole: "text"
            model: ListModel {
                id: cbItems
                ListElement { text: "Yoga for beginners"; value: "mymodel"}
                //ListElement { text: "Yoga for ..."; value: 1}
                //ListElement { text: "Yoga for ..."; value: 2}
            }
            width: 200
            onCurrentIndexChanged: {
                settings.exccategory = cbItems.get(currentIndex).value
                console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).value)
            }
        }

    GridLayout {
            id: gridselect
            anchors.fill: parent
            columns: 3
            rowSpacing: 5
            columnSpacing: 5
            anchors.margins: 5





            Repeater {
                model: mymodel



                Text{
                    padding: 20
                    Layout.row: index
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    //color: "#EEE"
                    //Text {
                          id: swipetitel
                          text: i18n.tr(model.headline)
                          font.pointSize: 14
                          /*
                          anchors {
                              verticalCenter: parent.verticalCenter
                              horizontalCenter: parent.horizontalCenter
                          }
                          */
                         //}
                }
            }

            Repeater {
                model: mymodel

                Image {
                    Layout.row: index
                    Layout.column: 1
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                                            id: swipeimg
                                            source: model.source
                                            width: 50
                                            height: 50

                                            /*
                                            anchors {
                                                verticalCenter: parent.verticalCenter
                                                horizontalCenter: parent.horizontalCenter
                                            }
                                            */

                                        }
            }

            Repeater {
                model: mymodel

                Text {
                                            id: swipedescr
                                            Layout.row: index
                                            Layout.column: 2
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            text: model.description
                                            font.pointSize: 12

                                            wrapMode: Text.WordWrap
                                            padding: 20
                                            horizontalAlignment: Text.AlignJustify
                                            /*
                                            anchors {
                                                verticalCenter: parent.verticalCenter
                                                horizontalCenter: parent.horizontalCenter


                                            }
                                            */


                                        }
            }
        }

}

}

/*


    Repeater{
        model: mymodel



        Item {
            id: listofexcitem


            RowLayout{
                anchors.fill: parent
                spacing: 0
                Rectangle{
                    Layout.preferredHeight: aboutPage.height * 0.13
                    Layout.preferredWidth: aboutPage.width * 0.13
                    color: "#EEE"
                    Text {
                          id: swipetitel
                          text: i18n.tr(model.headline)
                          font.pointSize: 14
                          anchors {
                              verticalCenter: parent.verticalCenter
                              horizontalCenter: parent.horizontalCenter
                          }
                         }
                }
                Rectangle{
                    Layout.preferredHeight: aboutPage.height * 0.13
                    Layout.preferredWidth: aboutPage.width * 0.53
                    Layout.fillWidth: true
                    color: "#EEE"
                    Image {
                                                id: swipeimg
                                                source: model.source
                                                width: 50
                                                height: 50
                                                anchors {
                                                    verticalCenter: parent.verticalCenter
                                                    horizontalCenter: parent.horizontalCenter
                                                }

                                            }
                }
                Rectangle{
                    Layout.preferredHeight: aboutPage.height * 0.13
                    Layout.preferredWidth: aboutPage.width * 0.33
                    Layout.fillWidth: true
                    color: "#EEE"
                    Text {
                                                id: swipedescr
                                                text: model.description
                                                font.pointSize: 12
                                                width: parent.width
                                                wrapMode: Text.WordWrap
                                                padding: 20
                                                horizontalAlignment: Text.AlignJustify
                                                anchors {
                                                    verticalCenter: parent.verticalCenter
                                                    horizontalCenter: parent.horizontalCenter


                                                }


                                            }
                }
            }



        }




    }

    */

    /*

    Flickable {
        anchors.fill: parent
        contentHeight: configuration.childrenRect.height

        Column {
            id: configuration
            anchors.fill: parent

            ListItem.SingleValue {
            }
            ListItem.Standard {
                text: i18n.tr("Automatic Updates every 60 seconds?")
                enabled: true
                control: Switch {
                    id: enableAutomaticUpdates
                    checked: settings.automaticRefresh
                    onClicked: {
                        if(settings.automaticRefresh)
                            settings.automaticRefresh = false
                        else
                            settings.automaticRefresh = true
                    }
                }
            }

            ListItem.Standard {
                text: i18n.tr("Do you want to see the price arrows?")
                enabled: true
                control: Switch {
                    id: enablePriceArrow
                    checked: settings.showArrows
                    onClicked: {
                        if(settings.showArrows)
                            settings.showArrows = false
                        else
                            settings.showArrows = true
                    }
                }
            }

            ListItem.Standard {
                text: i18n.tr("Do you want to see labels?")
                enabled: true
                control: Switch {
                    id: enableLabels
                    checked: settings.showLabels
                    onClicked: {
                        if(settings.showLabels)
                            settings.showLabels = false
                        else
                            settings.showLabels = true
                    }
                }
            }

            ListItem.Standard {
                text: i18n.tr("Your currency?")
                enabled: true
                control: ComboBox {
                            id: currency
                            height: units.gu(5)
                            width: units.gu(20)
                            currentIndex: settings.currentIndex
                            textRole: "text"
                            model: ListModel {
                                id: currencyModel
                                ListElement { text: "BRL";  symbol: "R$"; position: "right" }
                                ListElement { text: "CAD";  symbol: "C $"; position: "right" }
                                ListElement { text: "CHF";  symbol: "SFr."; position: "right" }
                                ListElement { text: "EUR";  symbol: "€"; position: "right" }
                                ListElement { text: "GBP";  symbol: "£"; position: "left" }
                                ListElement { text: "ISK";  symbol: "Kr"; position: "right" }
                                ListElement { text: "USD";  symbol: "$"; position: "left" }
                            }
                            onCurrentIndexChanged: {
                                settings.currentIndex = currency.currentIndex
                                settings.userCurrency = currencyModel.get(currentIndex).text
                                settings.userCurrencySymbol = currencyModel.get(currentIndex).symbol
                                settings.userCurrencySymbolPosition = currencyModel.get(currentIndex).position
                                getPrice()
                            }

                        }
            }
            ListItem.Standard {
                text: i18n.tr("Source of prices?")
                enabled: true
                control: ComboBox {
                            id: api
                            height: units.gu(5)
                            width: units.gu(20)
                            currentIndex: settings.apiIndex
                            textRole: "text"
                            model: ListModel {
                                id: apiModel
                                ListElement { text: "Coinbase";  code: "COINBASE" }
                                ListElement { text: "Cryptocompare.com";  code: "CRYPTOCOMPARE" }
                            }
                            onCurrentIndexChanged: {
                                settings.apiIndex = api.currentIndex
                                settings.api = apiModel.get(currentIndex).code
                                getPrice()
                            }

                        }
            }

        }
    }

    */

}
