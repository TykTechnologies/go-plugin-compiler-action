#!/bin/bash

set -xe

plugin_name=$1
plugin_path=$(date +%s)-${plugin_name}

if [[ -z $plugin_path ]]; then
    echo Missing plugin path
    exit 1
fi

yes | cp -r * $PLUGIN_BUILD_PATH
yes | cp -r vendor $GOPATH/src || true \
rm -rf $PLUGIN_BUILD_PATH/vendor

pwd=$(pwd)
cd $PLUGIN_BUILD_PATH \
    && go build -buildmode=plugin -ldflags "-pluginpath=$plugin_path" -o $plugin_name \
    && mv $plugin_name $pwd
