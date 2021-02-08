#!/usr/bin/env bash
# custom directory.

eval "$(starship init bash)"

export PROMPT_COMMAND="${PROMPT_COMMAND};history -a; history -n"

#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi
#
#export GPG_TTY="$(tty)"
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent

# History Settings
export HISTSIZE=2000000
export HISTFILESIZE=3000000
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%d/%m/%Y - %H:%M:%S > "
export HISTIGNORE="&:bg:fg:ll:"
export KUBE_EDITOR=vim

# Completions are managed through bash_it

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

GOPATH=~/sources/go
PATH=${PATH}:${GOPATH}/bin

# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# Cargo (Rust)
export PATH=$PATH:$HOME/.cargo/bin


#if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

# /usr/bin/gpg-connect-agent updatestartuptty /bye

# My Aliases
source ~/.bash_it/aliases/smana.bash