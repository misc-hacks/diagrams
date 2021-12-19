FROM linuxserver/openvscode-server:1.63.0

RUN apt-get update && apt-get install -y \
  graphviz \
  wget \
  && rm -rf /var/lib/apt/lists/*

ARG ANACONDA_RELEASE=Anaconda3-2021.11-Linux-x86_64.sh
RUN wget https://repo.anaconda.com/archive/${ANACONDA_RELEASE} -P /config/ \
    && bash /config/${ANACONDA_RELEASE} -b \
    && rm -f /config/${ANACONDA_RELEASE}

ARG PATH="/config/anaconda3/bin:${PATH}"
RUN pip install --no-cache-dir diagrams
