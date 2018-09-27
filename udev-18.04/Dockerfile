FROM ubuntu:18.04

MAINTAINER Jiahao Zhu <jiahao.zhu@transwarp.io>

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    zsh \
    vim \
    openssh-server \
    golang \
    libevent-dev \
    libncurses-dev \
    librados-dev \
    python \
    python-dev \
    cmake \
    make \
 && rm -rf /var/lib/apt/lists/* \
 && chsh -s /bin/zsh \
 && ls /usr/include/rados

ENV SHELL=/bin/zsh

RUN sh -x -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

RUN echo "root:secure" | chpasswd \
 && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
 && update-rc.d ssh defaults

RUN cd /tmp \
 && wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz \
 && tar xvzf tmux-2.7.tar.gz \
 && cd tmux-2.7 \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -rf ./tmux-2.7*

RUN cd \
 && git clone https://github.com/jhzhu89/.tmux.git \
 && ln -s -f .tmux/.tmux.conf \
 && ln -s -f .tmux/.tmux.conf.local

RUN cd \
 && git clone https://github.com/jhzhu89/vim-config-new.git ~/.vim \
 && http_proxy=172.16.0.249:3128 https_proxy=172.16.0.249:3128 bash ~/.vim/bin/install \
 && ln -s -f .vim/vimrc .vimrc \
 && ln -s -f .vim/vimrc.local .vimrc.local \
 &&  ~/.vim/bundle/YouCompleteMe/install.py --go-completer

ENV GOPATH=/root/.go

ADD install-vim-go-packages.sh /tmp

RUN echo "set encoding=utf-8" >> ~/.vimrc.local \
 && mkdir $HOME/.go \
 && bash -x /tmp/install-vim-go-packages.sh

ENV GOPATH=/root/go

RUN echo "PATH=$HOME/.go/bin:$HOME/go/bin:$PATH" >> ~/.zshrc

RUN apt-get update && apt-get install -y \
    librbd-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD service ssh start; sleep infinity
