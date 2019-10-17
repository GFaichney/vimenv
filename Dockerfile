########### BINARY COMPILE ###########
FROM alpine:latest as binary
RUN apk add git
RUN apk add ncurses-dev
RUN apk add gnome-desktop-dev
RUN apk add python-dev
RUN apk add ruby-dev
RUN apk add lua-dev
RUN apk add libxpm-dev
RUN apk add libx11-dev
RUN apk add luajit
RUN apk add libxt-dev
RUN apk add python3-dev
RUN apk add gcc
RUN apk add musl-dev
RUN apk add make
RUN mkdir /gitbuild
WORKDIR /gitbuild
RUN git clone https://github.com/vim/vim.git
WORKDIR /gitbuild/vim
RUN ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
RUN make install

########### BASE ###########
FROM alpine:latest as base
RUN apk add musl
RUN apk add ruby
RUN apk add gnome-desktop
RUN apk add libxpm
RUN apk add lua
COPY --from=binary /usr/local/bin/vim /usr/local/bin/vim
COPY --from=binary /usr/local/share/vim /usr/local/share/vim
RUN mkdir /workdir
COPY vimrc/base.vimrc /root/.vimrc
WORKDIR /workdir
RUN apk add git
RUN git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
RUN git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
RUN git clone https://github.com/sheerun/vim-polyglot ~/.vim/pack/default/start/vim-polyglot
RUN git clone https://github.com/vim-airline/vim-airline-themes.git ~/vim-airline-themes
RUN apk add rsync
RUN rsync -r ~/vim-airline-themes/ ~/.vim
RUN git clone https://github.com/rafi/awesome-vim-colorschemes ~/awesome-vim-colorschemes
RUN rsync -r ~/awesome-vim-colorschemes/ ~/.vim

ENV TERM=xterm-256color
CMD vim .

