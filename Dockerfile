FROM ubuntu:18.04

ENV NOMAD_VERSION=1.0.2
ENV NOMAD_ARCH=amd64

RUN apt update \
  && apt install -y \
    curl \
    git \
    unzip

RUN curl https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_${NOMAD_ARCH}.zip \
    > /tmp/nomad_${NOMAD_VERSION}_linux_${NOMAD_ARCH}.zip \
  && unzip -d /tmp /tmp/nomad_${NOMAD_VERSION}_linux_${NOMAD_ARCH}.zip \
  && mv /tmp/nomad /usr/bin/nomad

RUN rm -rf /tmp/nomad*

ENTRYPOINT ["/usr/bin/nomad"]
CMD ["-help"]
