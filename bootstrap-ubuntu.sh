#!/usr/bin/env bash
sudo apt install ruby
sudo apt install git
sudo apt install vim  
mkdir ~/workspace
cd ~/workspace
git clone https://github.com/paulcurley/dotfiles.git
git remote set-url origin git@github.com:paulcurley/dotfiles.git

cd dotfiles;

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash


sudo gem install vmail
sudo gem install capistrano
sudo gem install rails
sudo gem install tmuxinator


########## Variables
 
dir=~/workspace/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .gvimrc .gitconfig .aliases .ackrc .zshrc .exports .tmux.conf .tmuxinator .tm_properties"        # list of files/folders to symlink in homedir
 
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

