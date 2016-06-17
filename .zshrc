# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
for file in ~/.{path,exports,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

#tmuxinator titles
export DISABLE_AUTO_TITLE=true


ulimit -n 1024




# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
#source ~/.bin/tmuxinator.zsh


# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/bin:/Users/paulcurley/.rvm/gems/ruby-1.9.3-p374/bin:/Users/paulcurley/.rvm/gems/ruby-1.9.3-p374@global/bin:/Users/paulcurley/.rvm/rubies/ruby-1.9.3-p374/bin:/Users/paulcurley/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.node/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
prompt_context () {  }
