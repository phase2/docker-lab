# This Dockfile is used for the web container in Kubernetes cluster
FROM alpine:3.8

RUN apk add --no-cache \
      grep \
      curl \
      bash \
      git \
      dumb-init \
      openssl \
      libc6-compat

RUN curl -s https://raw.githubusercontent.com/zaquestion/lab/master/install.sh | bash

WORKDIR /home/git
ENTRYPOINT [ "/usr/bin/dumb-init", "--", "lab" ]
