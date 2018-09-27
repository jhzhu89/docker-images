#!/bin/bash

set -e

mkdir /tmp/ceph
/micro-osd.sh /tmp/ceph
export CEPH_CONF=/tmp/ceph/ceph.conf

export PATH=/go/bin:$PATH

sleep infinity
