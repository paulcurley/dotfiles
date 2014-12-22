#!/usr/bin/env bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew doctor


git clone https://github.com/paulcurley/dotfiles.git
cd dotfiles;



sh .brew
npm install -g bower
npm install -g david
npm install -g grunt-cli
npm install -g yo
npm install -g zombie
npm install -g plato

gem install vmail
gem install capistrano
gem install sass
gem install rails
gem install tmuxinator


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


sh .osx
