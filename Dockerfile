FROM golang:1.18-buster

ARG GOPROXY

WORKDIR /workspace
COPY . .
ENV GOPROXY=${GOPROXY:-https://proxy.golang.org}

RUN make build
RUN chmod u+x /workspace/bin/csi-demo

ENTRYPOINT ["/workspace/bin/csi-demo"]
