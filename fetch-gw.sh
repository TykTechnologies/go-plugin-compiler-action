#!/bin/bash

set -xe

mkdir -p $TYK_GW_PATH $PLUGIN_BUILD_PATH

curl -sL "https://api.github.com/repos/TykTechnologies/tyk/tarball/${INPUT_GW_TAG}" | \
    tar -C $TYK_GW_PATH --strip-components=1 -xzf - 
yes | cp -r $TYK_GW_PATH/vendor $GOPATH/src && rm -rf $TYK_GW_PATH/vendor
