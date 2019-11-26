#!/bin/bash
sudo apt-get install zsh
chsh -s /bin/zsh
sudo sed -i 's#root:/bin/bash#root:/bin/zsh#' /etc/passwd
sudo apt-get install git
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
sed -i 's#ZSH_THEME=\"robbyrussell\"#ZSH_THEME=\"risto\"#' ~/.zshrc
source ~/.zshrc
