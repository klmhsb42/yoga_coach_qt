/*
 * Copyright (C) 2022  Sebastian Britz
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * coach is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4
import QtMultimedia 5.4
//import ArcGIS.AppFramework.Speech 1.0
//import QtWebView 1.15
//import Morph.Web 0.1
import QtWebEngine 1.7






MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'coach.klmhsb42'
    automaticOrientation: true




    //Colors
        property string frontColor:     "#000000"  // or "#000000" format
        property string backColor:      "#CFCFCF"    // or "#000000" format
        property string detailsColor:   "#949494"      // or "#000000" format
        property string accentColor:    "#CFCFCF"    // or "#000000" format

    width: units.gu(45)
    height: units.gu(75)





    Settings {
            id: settings
            property bool videorecord: false
            property string exccategory: 'mymodel'
        }

    PageStack {
            id: pageStack
            Component.onCompleted: pageStack.push(mainPage)

    Page {
        anchors.fill: parent
        id: mainPage


        header: PageHeader {
            id: header
            title: i18n.tr('Coach')
            StyleHints {
                                foregroundColor: frontColor
                                backgroundColor: backColor
                                dividerColor: detailsColor
                            }
            trailingActionBar {
                                actions: [
                                    Action {
                                        iconName: "settings"
                                        text: "settings"

                                        onTriggered: pageStack.push(Qt.resolvedUrl("Settings.qml"))
                                    },
                                    Action {
                                        iconName: "info"
                                        text: "infos"

                                        onTriggered: pageStack.push(Qt.resolvedUrl("About.qml"))
                                    },
                                    Action {
                                        iconName: "select"
                                        text: "select"

                                        onTriggered: pageStack.push(Qt.resolvedUrl("Select.qml"))
                                    },
                                    Action {
                                        iconName: "history"
                                        text: "history"

                                        onTriggered: pageStack.push(Qt.resolvedUrl("History.qml"))
                                    },
                                    Action {
                                        iconName: "account"
                                        text: "profile"

                                        onTriggered: pageStack.push(Qt.resolvedUrl("Profile.qml"))
                                    }
                                ]
                            }
        }



        GridLayout {
            id : grid

            anchors.fill: parent
            rows    : 12
            columns : 12

            property double colMulti : grid.width / grid.columns
            property double rowMulti : grid.height / grid.rows
            function prefWidth(item){
                return colMulti * item.Layout.columnSpan
            }
            function prefHeight(item){
                return rowMulti * item.Layout.rowSpan
            }





                Rectangle{

                    color: '#EEE'
                    //anchors.fill: parent

                    Layout.rowSpan   : 1
                    Layout.columnSpan: 2
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)

                        Text{
                            id: setscore
                            text: '0/10 Score'
                            font.pointSize: 24
                            color: 'black'

                            anchors {
                                verticalCenter: parent.verticalCenter
                                horizontalCenter: parent.horizontalCenter
                            }



                        }

                }

Rectangle{

    color: '#EEE'

    Layout.rowSpan   : 1
    Layout.columnSpan: 8
    Layout.preferredWidth  : grid.prefWidth(this)
    Layout.preferredHeight : grid.prefHeight(this)

                Text {
                    id: headlinetxt

                    text: i18n.tr('Welcome, happy to see you!')
                    font.pointSize: 18

                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }
}

Rectangle {
    color : '#EEE'
    Layout.rowSpan : 1
    Layout.columnSpan : 2
    Layout.preferredWidth  : grid.prefWidth(this)
    Layout.preferredHeight : grid.prefHeight(this)

    id: timer

    property int counter: 0

        Timer {
            id: timercounter
            interval: 10;
            running: false;
            repeat: true
            onTriggered: settime.text = new Date(timer.counter += 1).toLocaleTimeString(Qt.locale(), "mm" + ":" + "ss" + ":" + "zzz") //"hh " + "mm " + "ss " + "zzz"
        }




                Text {
                    id: settime

                    text: i18n.tr('00:00:000') //time.text =
                    font.pointSize: 24

                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }


                }



/*
                TextToSpeech {
                                id: textToSpeech
                                volume: 0.7
                                rate: 0.3
                        }
                        */

            }


Rectangle {
    id: viewrect
    color : '#EEE'
    Layout.rowSpan   : 8 //1
    Layout.columnSpan: 6
    Layout.preferredWidth  : grid.prefWidth(this)
    Layout.preferredHeight : grid.prefHeight(this)

    ColumnLayout {

        anchors.fill: parent
        spacing: 0


        Rectangle{
            Layout.preferredHeight: viewrect.height * 0.1
            Layout.fillWidth: true
            //anchors.fill: parent
            color: viewrect.color

    Label {
        id: exccat

        text: i18n.tr('Yoga for beginners')
        font.pointSize: 18

        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

    }

        }

    /*
}



            Rectangle {
                id: viewrect
                color : '#EEE'
                Layout.rowSpan   : 7
                Layout.columnSpan: 6
                Layout.preferredWidth  : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)

*/

        Rectangle{
            id: swiperect
            Layout.preferredHeight: viewrect.height * 0.9
            Layout.fillWidth: true
            clip:true



                ListModel{
                        id: mymodel


                        /*
                                ListElement{
                                    headline: "2/7 Tree with arms up"
                                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                                    source: "exercises/0/1/yoga.jpg"
                                }
                                ListElement{
                                    headline: "3/7 Lord of the dance"
                                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                                    source: "exercises/0/2/yoga.jpg"
                                }
                                ListElement{
                                    headline: "4/7 Half boat"
                                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                                    source: "exercises/0/3/yoga.jpg"
                                }
                                ListElement{
                                    headline: "5/7 Staning splits"
                                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                                    source: "exercises/0/5/yoga.jpg"
                                }
                                ListElement{
                                    headline: "7/7 Warrior III with Prayer Hands"
                                    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                                    source: "exercises/0/6/yoga.jpg"
                                }

                                */
                    }




                    SwipeView{
                        id: view
                        interactive: true

                        currentIndex: 0
                        anchors.fill: parent

                        Repeater{
                            model: mymodel



                            Item {
                                id: firstPage


                                ColumnLayout{
                                    anchors.fill: parent
                                    spacing: 0
                                    Rectangle{
                                        Layout.preferredHeight: swiperect.height * 0.13
                                        Layout.fillWidth: true
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
                                        Layout.preferredHeight: swiperect.height * 0.53
                                        Layout.fillWidth: true
                                        color: "#EEE"
                                        Image {
                                                                    id: swipeimg
                                                                    source: model.source

                                                                    height: parent.height
                                                                    anchors {
                                                                        verticalCenter: parent.verticalCenter
                                                                        horizontalCenter: parent.horizontalCenter
                                                                    }

                                                                }
                                    }
                                    Rectangle{
                                        Layout.preferredHeight: swiperect.height * 0.33
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


                    }

  }
}



            }








            Rectangle {
                color : '#000000'
                Layout.rowSpan   : 8
                Layout.columnSpan: 6
                Layout.preferredWidth  : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)

                /*
                Label {
                    anchors {
                        top: header.bottom
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    text: i18n.tr('Live camera.')

                    verticalAlignment: Label.AlignVTop
                    horizontalAlignment: Label.AlignHCenter
                    color: '#FFFFFF'
                }

                */

/*
                WebEngineView {
                        url: Qt.resolvedUrl( "../src/test.html" )
                        x: 0
                        y: 0
                        smooth: false
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            left: parent.left
                            right: parent.right
                        }
                    }
*/



                /*
                Item {
                    width: 640
                    height: 360

                    Camera {
                        id: camera

                        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                        exposure {
                            exposureCompensation: -1.0
                            exposureMode: Camera.ExposurePortrait
                        }

                        flash.mode: Camera.FlashRedEyeReduction

                        imageCapture {
                            onImageCaptured: {
                                photoPreview.source = preview  // Show the preview in an Image
                            }
                        }
                    }

                    VideoOutput {
                        source: camera
                        anchors.fill: parent
                        focus : visible // to receive focus and capture key events when visible
                    }

                    Image {
                        id: photoPreview
                    }
                }


*/






            }
            Rectangle {
                id : blueRect
                color : '#EEE'
                Layout.rowSpan : 2
                Layout.columnSpan : 12
                Layout.preferredWidth  : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)

                ColumnLayout {
                    width: parent //parent.width
                    anchors.centerIn: parent
                    spacing: 25


                    RowLayout {

                        Button {
                            id: button_start
                            text: "Start"
                            Layout.fillWidth: true
                            enabled: true
                            onClicked: {
                                    view.interactive = false
                                    button_prev.enabled = false
                                    button_next.enabled = false
                                    button_start.enabled = false
                                    button_stop.enabled = true
                                    startpython()


                                }
                        }

                        Button {
                            id: button_stop
                            text: "Stop"
                            Layout.fillWidth: true
                            enabled: false
                            onClicked: {
                                    view.interactive = true
                                    button_prev.enabled = showprevswipe()
                                    button_next.enabled = shownextswipe()
                                button_start.enabled = true
                                button_stop.enabled = false
                                setscore.text = '0/10 Score'
                                setscore.color = 'black'
                                //settime.text = '00:00'
                                settime.color = 'black'
                                timercounter.stop()
                                timer.counter = 0
                                }
                        }
                    }



                    RowLayout {
                        Button {
                            id: button_prev
                            text: "Prev"
                            Layout.fillWidth: true
                            enabled: showprevswipe()
                            onClicked: view.decrementCurrentIndex()
                        }

                        Button {
                            id: button_next
                            text: "Next"
                            Layout.fillWidth: true
                            enabled: shownextswipe()
                            onClicked: view.incrementCurrentIndex()
                        }


                    }
                }

            }
        }








    }

}

    Python {
        id: python

        Component.onCompleted: {

            addImportPath(Qt.resolvedUrl('../src/'));




            importModule('example', function() {
                console.log('module imported');
                //python.call('example.time', ['Hello World!'], function(returnValue) {
                    //console.log('example.time returned ' + returnValue);
                    //headlinetxt.text = returnValue;
                //})

            });
/*
            importModule('testpose', function() {
                console.log('pose module imported');
                testpose();


            });
*/

        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }




    function startpython(){



        python.call('example.time', ['Hello World!'], function(returnValue) {
            //console.log('example.time returned ' + returnValue);
            headlinetxt.text = returnValue[0];
            //settime.text = returnValue[1];
            if (parseInt(returnValue[2]) > 7){
                setscore.color = 'green'
            }else{
                setscore.color = 'green'
            };

            setscore.text = returnValue[2]+'/10 Score';    

        })

        //textToSpeech.say(headlinetxt.text)


        headlinetxt.text = "Please go into position so I can see you."


        python.call('example.checkifready', function(returnValue) {
            if (returnValue === True){
                headlinetxt.text = "I'm starting the timer now."
                timercounter.start()
                headlinetxt.text = "Please go into position of the exercise."
            }
        })

        headlinetxt.text = "I can't see you anymore, please go back."


    }

    function showprevswipe(){
        swiperesult = False
        if (view.currentIndex > 0){
            swiperesult = True
        }
        return swiperesult
    }

    function shownextswipe(){
        swiperesult2 = False
        if (view.currentIndex < view.count - 1){
            swiperesult2 = True
        }
        return swiperesult2
    }



    Component.onCompleted: {

            var xhr = new XMLHttpRequest;
            xhr.open("GET", "../src/exercises.json");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    // use file contents as required
                    var JsonObject= JSON.parse(response);
                    //var objectArray = parseJSONString(json, query);

                    for ( var key in JsonObject['category'][0]['exercise'] ) {

                        //console.log(JsonObject['category'][0]['exercise'][key]["title"]);
                        var exercise_title = JsonObject['category'][0]['exercise'][key]["title"];
                        var exercise_img = "../" + JsonObject['category'][0]['exercise'][key]["img"].replace("static","src");
                        //mymodel.append( jo );
                        mymodel.append({headline: exercise_title, source: exercise_img});
                    }

                }
            };
            xhr.send();
        }



}


