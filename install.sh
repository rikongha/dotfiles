#!/bin/sh

# script to install and setup a mac system for development (just how I like it)

# install xcode command line tools
xcode-select --install


# install homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install zsh, wget, iterm2
brew install zsh wget iterm2

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# install zsh-autosuggestions, zsh-syntax-highlighting plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# install useful terminal tools
brew install fzf tree ack

# install docker
brew cask install docker

# install vim, neovim, get vimrc and maximum awesome
brew install vim neovim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cd ~/.vim_runtime && git pull --rebase && cd -
git clone https://github.com/square/maximum-awesome.git
cd maximum-awesome
rake

# install vs code
brew cask install visual-studio-code

# install postgres and mysql
brew install postgres mysql
brew services start postgresql
# brew services start mysql
mysql.server start

# setup support for ntfs - could not get this to work properly in mojave, had to remove it
# brew cask install osxfuse
# brew install ntfs-3g

# Create a symlink for mount_ntfs
# sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.original
# sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs

# setup up development folders
mkdir -p ~/projects/{active, archive, config, resources, tmp}
export PROJECTS="$HOME/projects"
git clone https://github.com/rikongha/dotfiles.git ~/projects/config

# TODO setup go
# setup tools for Go development

export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOROOT}/bin"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
brew install go
go version

# TODO setup gopath

# export the go path in the zshrc file
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc

# create go directory
mkdir -p ~/projects/personal/src/github.com/rikongha

# backup existing zshrc config and overwrite with copy from repo
cp .zshrc .zshrc_bkup
cat $PROJECTS/config/dotfiles/.zshrc > ~/.zshrc


source ~/.zshrc


echo "Run '>shell command' in vscode to activate code command in the terminal"
echo "Check out this link to do more: https://sourabhbajaj.com/mac-setup/"