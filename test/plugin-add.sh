#!/bin/bash
set -x #echo on
set -e #exit on error

CORDOVA_VERSION=$1
PLATFORM=$2
PLATFORM_VERSION=$3
PLUGIN="$(pwd)"

SRC="$(pwd)"
FOLDER="../.build-$PLATFORM"
cd $FOLDER

CORDOVA_MAJOR_VERSION=$(echo $CORDOVA_VERSION | cut -c 1-1)

if [[ "$CORDOVA_MAJOR_VERSION" == "6" ]]; then
  FETCH_COMMAND="--fetch"
else
  FETCH_COMMAND=$SRC
fi

if [[ "$PLUGIN" == "cordova-android-play-services-gradle-release" ]]; then
  $SRC/node_modules/.bin/cordova plugin add $PLUGIN --variable PLAY_SERVICES_VERSION=+ $FETCH_COMMAND --save
elif [[ "$PLUGIN" == "cordova-android-firebase-gradle-release" ]]; then
  $SRC/node_modules/.bin/cordova plugin add $PLUGIN --variable FIREBASE_VERSION=+ $FETCH_COMMAND --save
else
  $SRC/node_modules/.bin/cordova plugin add $PLUGIN $FETCH_COMMAND
fi
