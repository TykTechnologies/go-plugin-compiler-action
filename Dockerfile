FROM golang:1.12.17
LABEL io.tyk.vendor="Tyk" \
      version="1.0" \
      description="plugin build in a Github action"

ENV GOPATH=/go
ENV TYK_GW_PATH=${GOPATH}/src/github.com/TykTechnologies/tyk
ENV PLUGIN_BUILD_PATH=/go/src/plugin-build

RUN mkdir -p $GOPATH $TYK_GW_PATH $PLUGIN_BUILD_PATH

COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]

