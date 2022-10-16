# Yoga Coach QT

A computer vision based yoga coach qt (QML) app

![logo](https://github.com/klmhsb42/yoga_coach_qt/blob/main/assets/logo.svg)

## About

This is the native app version of Yoga Coach. The project was started and detailed documented in the [web version](https://github.com/klmhsb42/yoga_coach_web).


## Credits

This is a fork of the ubuntu touch app "cryptoprice" from dev Malte Kiefer https://gitlab.com/maltekiefer/cryptoprice

As for the web version:

I thank all people from [Spiced Academy](https://www.spiced-academy.com/de/about) and [Bundesagentur f&uuml;r Arbeit](https://www.arbeitsagentur.de/) that supported me. Images for exercises were taken from [commons.wikimedia.org](https://commons.wikimedia.org/). The respective URL and date of access are shown in the app. Descriptions of exercises are taken from the [en.wikipedia.org](https://en.wikipedia.org/wiki/) JSON API and a respective link given to further read the article. The image or video stream processing was followed from the [MediaPipe Pose python API](https://google.github.io/mediapipe/solutions/pose.html#python-solution-api). The angles were calculated following [this thread](https://stackoverflow.com/questions/2827393/angles-between-two-n-dimensional-vectors-in-python).

## Screenshots

see ...

## How to build and develop

First, install clickable https://clickable-ut.dev/en/latest/

### For building on dekstop and development:

1. download the project directory
2. ```cd``` into project directory
3. run ```clickable desktop``` or ```clickable ide qtcreator```

### For building on Ubuntu touch device

1. connect your device via USB to your computer
2. run ```clickable```

or

1. connect your device via WiFi network same as your computer
2. run ```clickable --ssh [IP-of-your-ut-device]```

## Publish
take the .click file located in /build/all/app/ folder
and 
login and upload  under https://open-store.io/
