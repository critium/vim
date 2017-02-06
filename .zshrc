
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="miloshadzic"
#ZSH_THEME="pygmalion"
#ZSH_THEME="nanotech"
#ZSH_THEME="blinks"
#ZSH_THEME="agnoster"


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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git osx fasd tmux vi-mode)
#plugins=(git fasd)
#plugins=(fasd osx vagrant vi-mode)
plugins=(fasd osx vagrant)

source $ZSH/oh-my-zsh.sh
alias cdpr="cd ~/dev/projects/"
alias cdrf="cd ~/dev/projects/cargotel/"
alias p="play -Dlogger.file=conf/logger.xml"
alias g="mvim --remote-silent"



#alias p=play2
#alias run="play2 run"
#alias run_nr="play2_norefresh run"
#alias clean="play2 clean"
#alias compile="play2 compile"
#alias test="play2_test"
#alias cdbr="cd ~/shortcuts/betareturn/code"
#alias debug="play_debug"
#alias pull="git pull"
#alias push="git push"
#alias status="git status"
#alias mvimbr="mvim ~/shortcuts/betareturn/code/play/app/Global.java"

# Customize to your needs...
#export PATH=$PATH:/Users/pule/swdev/workspace/betareturn/trunk/deploy/play-2.0.6/:/Users/pule/shortcuts/betareturn/bin/:/usr/local/java/1_6/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin
export PATH=$PATH:/usr/local/java/1_7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/sbin

eval "$(fasd --init auto)"

#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}".
#}

source ~/nvm/nvm.sh
#source /usr/local/share/zsh/site-functions/_aws

setopt no_share_history

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/bin:$PATH

export LIQUIBASE_HOME=/usr/local/Cellar/liquibase/3.1.1/libexec
export JAVA_HOME=/usr/local/java/1_7
export SCALATRA_JREBEL=/usr/local/jrebel/jrebel.jar
export BROWSER=chrome


cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
