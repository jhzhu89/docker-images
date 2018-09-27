#!/usr/bin/bash

proxy='172.16.0.249:3128'

pkgs='github.com/klauspost/asmfmt/cmd/asmfmt
github.com/derekparker/delve/cmd/dlv
github.com/kisielk/errcheck
github.com/davidrjenni/reftools/cmd/fillstruct
github.com/nsf/gocode
github.com/rogpeppe/godef
github.com/zmb3/gogetdoc
golang.org/x/tools/cmd/goimports
github.com/golang/lint/golint
github.com/alecthomas/gometalinter
github.com/fatih/gomodifytags
golang.org/x/tools/cmd/gorename
github.com/jstemmer/gotags
golang.org/x/tools/cmd/guru
github.com/josharian/impl
github.com/dominikh/go-tools/cmd/keyify
github.com/fatih/motion
github.com/koron/iferr'

for pkg in $pkgs
do
  echo "installing $pkg ..."
  http_proxy=$proxy https_proxy=$proxy go get -v $pkg
done

echo "done ..."
