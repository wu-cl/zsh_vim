#!/bin/bash

# zsh
yum install -y zsh
chsh -s /bin/zsh
yum install -y git
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ohmyzsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
sed -i 's#ZSH_THEME=\"robbyrussell\"#ZSH_THEME=\"risto\"#' ~/.zshrc
source ~/.zshrc

# upgrade vim to v8.0
rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm
rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7
yum -y remove vim-minimal vim-common vim-enhanced sudo
yum -y --enablerepo=gf-plus install vim-enhanced sudo

# vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

wget https://raw.githubusercontent.com/wu-cl/zsh_vim/master/.vimrc -O ~/.vimrc


# tmux
# install deps
sudo yum install -y gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -LOk https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
tar -xf libevent-2.1.11-stable.tar.gz
cd libevent-2.1.11-stable
./configure --prefix=/usr/local
make
sudo make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL

curl -LOk https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
tar -xf tmux-3.2a.tar.gz
cd tmux-3.2a
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make
sudo make install

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
tmux -V

wget https://raw.githubusercontent.com/wu-cl/zsh_vim/master/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/wu-cl/zsh_vim/master/.tmux.conf.local -O ~/.tmux.conf.local
