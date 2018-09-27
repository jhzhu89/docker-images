FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  git \
  software-properties-common \
  uuid-runtime \
  wget

ARG CEPH_REPO_URL=http://mirrors.163.com/ceph/debian-luminous/
RUN wget -q -O- 'http://mirrors.163.com/ceph/keys/release.asc' | apt-key add -
RUN apt-add-repository "deb ${CEPH_REPO_URL} bionic main"

RUN apt-get update && apt-get install -y \
  ceph \
  libcephfs-dev \
  librados-dev \
  librbd-dev \
  golang \
  && \
  rm -rf /var/lib/apt/lists/*

ENV GOPATH /go
WORKDIR /go/src/github.com/ceph/go-ceph

ENV CEPH_CONF /tmp/ceph/ceph.conf

COPY micro-osd.sh /
COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
