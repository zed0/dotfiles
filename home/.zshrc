# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zed0"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial ninja)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/zed0/.local/bin:/home/zed0/bin:/home/zed0/.gem/ruby/1.8/bin:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/games
export CGCC_FORCE_COLOR=true
export FZF_DEFAULT_COMMAND="ag -l -g \"\""

fpath=(~/.zsh/completion $fpath)

# ssh autocomplete:
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion::complete:*' use-cache on
compinit -u

# don't auto correct lua to la:
alias lua='nocorrect lua '
alias tmux='tmux -2'
alias vim=nvim
#alias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"

# make valgrind usable
ulimit -c unlimited
alias cvalgrind='valgrind --leak-check=full --track-origins=yes --db-attach=yes --db-command='\''cgdb -nw %f %p'\'

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;11m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;46m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;13m' \
    man "$@"
}

source $HOME/.homesick/repos/homeshick/homeshick.sh

PATH="/home/zed0/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/zed0/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/zed0/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/zed0/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/zed0/perl5"; export PERL_MM_OPT;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
