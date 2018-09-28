FROM centos:centos7

MAINTAINER Jiahao Zhu <jiahao.zhu@transwarp.io>

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
ADD epel-7.repo /etc/yum.repos.d/epel-7.repo
ADD ceph.repo /etc/yum.repos.d/ceph.repo

RUN yum install -y centos-release-scl && \
  yum install -y devtoolset-7-gcc-c++ && \
  yum install -y imake && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN yum install -y librados2-devel && \
  yum install -y librbd-devel && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  ls /usr/include/rados

ADD go1.11.linux-amd64.tar.gz /usr/local/

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

WORKDIR $GOPATH

CMD ["/usr/bin/scl", "enable", "devtoolset-7", "bash"]
