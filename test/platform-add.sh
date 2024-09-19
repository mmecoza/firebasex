#!/bin/bash
set -x #echo on
set -e #exit on error

CORDOVA_VERSION=$1
PLATFORM=$2
PLATFORM_VERSION=$3
SRC="$(pwd)"
FOLDER="../.build-$PLATFORM"
rm -rf $FOLDER

npm install "cordova@$CORDOVA_VERSION" --no-save
$SRC/node_modules/.bin/cordova create $FOLDER africa.mugadza.fireTest HelloWorld

cd $FOLDER

$SRC/node_modules/.bin/cordova platform add "$PLATFORM@$PLATFORM_VERSION"
