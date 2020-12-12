#!/bin/bash

set -xe

plugin_name=$1
plugin_path=$(date +%s)-${plugin_name}

if [[ -z $plugin_name ]]; then
    echo Missing plugin name
    exit 1
fi

curl -sL "https://api.github.com/repos/TykTechnologies/tyk/tarball/${INPUT_GW_TAG}" | \
    tar -C $TYK_GW_PATH --strip-components=1 -xzf - 
yes | cp -r $TYK_GW_PATH/vendor/* $GOPATH/src && rm -rf $TYK_GW_PATH/vendor

yes | cp -r * $PLUGIN_BUILD_PATH
yes | cp -r vendor $GOPATH/src || true \
rm -rf $PLUGIN_BUILD_PATH/vendor

cd $PLUGIN_BUILD_PATH \
    && go build -buildmode=plugin -ldflags "-pluginpath=$plugin_path" -o $plugin_name \
    && mv $plugin_name $pwd
