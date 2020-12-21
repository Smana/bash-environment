#!/usr/bin/env bash
# custom directory.

export PROMPT_COMMAND="${PROMPT_COMMAND};history -a; history -n"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# History Settings
export HISTSIZE=2000000
export HISTFILESIZE=3000000
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%d/%m/%Y - %H:%M:%S > "
export HISTIGNORE="&:bg:fg:ll:"

# Dailymotion
PATH=${PATH}:~/sources/dailymotion/dm/bin
export VAULT_ADDR=https://vault.dm.gg:8200

if [ -f ~/.kube/kubectl_completion ]; then
     . ~/.kube/kubectl_completion
fi
export KUBE_EDITOR=vim

if [ -f ~/.kube/helm_completion ]; then
     . ~/.kube/helm_completion
fi

if [ -f ~/.kube/kubectl_aliases ]; then
     . ~/.kube/kubectl_aliases
fi

if [ -f ~/.kube/k3d_completion ]; then
     . ~/.kube/k3d_completion
fi

if [ -f ~/.skaffold_completion ]; then
     . ~/.skaffold_completion
fi

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

GOPATH=~/go
PATH=${PATH}:${GOPATH}/bin
# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[ -f ~/.fzf.bash  ] && source ~/.fzf.bash

#if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

/usr/bin/gpg-connect-agent updatestartuptty /bye  

# My Aliases
source ~/.bash_it/aliases/smana.bash
