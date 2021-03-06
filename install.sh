#!/bin/sh

# script to install and setup a mac system for development (just how I like it)

# install xcode command line tools
xcode-select --install


# install homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install zsh
brew install zsh

#install wget
brew install wget

# install iterm2
brew cask install iterm2


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

# install vim, get vimrc and maximum awesome
brew install vim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cd ~/.vim_runtime && git pull --rebase && cd -
git clone https://github.com/square/maximum-awesome.git
cd maximum-awesome
rake

# install vs code
brew cask install visual-studio-code

# install postgres
brew install postgres
brew services start postgresql

# install mysql
brew install mysql
# brew services start mysql
mysql.server start

# setup support for ntfs
# brew cask install osxfuse
# brew install ntfs-3g

# Create a symlink for mount_ntfs
# sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.original
# sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs

# TODO install golang
brew install go
go version

# TODO setup gopath

# export the go path in the zshrc file
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc

# create go directory
mkdir -p ~/projects/personal/src/github.com/leroi

# copy the zshrc 
cat .zshrc >> ~/.zshrc


source ~/.zshrc


echo "Run '>shell command' in vscode to activate code command in the terminal"
echo "Check out this link to do more: https://sourabhbajaj.com/mac-setup/"