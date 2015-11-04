#!/usr/bin/env bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew doctor
mkdir ~/workspace
cd ~/workspace
git clone https://github.com/paulcurley/dotfiles.git
cd dotfiles;


sh ~/dotfiles/.brew
npm install -g bower
npm install -g david
npm install -g grunt-cli
npm install -g yo
npm install -g zombie
npm install -g plato

sudo gem install vmail
sudo gem install capistrano
sudo gem install sass
sudo gem install rails
sudo gem install tmuxinator


########## Variables
 
dir=~/workspace/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .gvimrc .gitconfig .aliases .ackrc .zshrc .exports .tmux.conf"        # list of files/folders to symlink in homedir
 
##########
 
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
 

echo "Changing to the $dir directory"
mkdir -p $dir
cd $dir
cp -r $dir/.vim ~/.vim
 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
    source ~/$file

done
 

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s $(which zsh)

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

sh ~/workspace/dotfiles/.osx
