#!/bin/bash
set -x #echo on
set -e #exit on error

CORDOVA_VERSION=$1
PLATFORM=$2
PLATFORM_VERSION=$3
SRC="$(pwd)"
FOLDER="../.build-$PLATFORM"
cd $FOLDER

$SRC/node_modules/.bin/cordova build $PLATFORM
