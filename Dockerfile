FROM tykio/tyk-build-env:latest
LABEL io.tyk.vendor="Tyk" \
      version="1.0" \
      description="plugin build in a Github action"

ENV GOPATH=/go
ENV TYK_GW_PATH=${GOPATH}/src/github.com/TykTechnologies/tyk
# This directory will contain the plugin source and will be
# mounted from the host box by the user using docker volumes
ENV PLUGIN_BUILD_PATH=/go/src/plugin-build

ENTRYPOINT ["/build.sh"]

