FROM --platform=${TARGETPLATFORM} ghcr.io/misc-hacks/ubuntu-dev:20.04

ARG PACKAGES="\
  graphviz \
  python3-pip \
"
RUN apt-get update \
    && apt-get install -y ${PACKAGES} \
    && apt-get clean \
    && rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

RUN pip install --no-cache-dir diagrams
