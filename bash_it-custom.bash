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
export HISTSIZE=200000
export HISTFILESIZE=300000
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

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


GOPATH=~/go
PATH=${PATH}:${GOPATH}/bin
# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin
# MicroK8S
export PATH=$PATH:/var/lib/snapd/snap/bin

[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash 

#if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

/usr/bin/gpg-connect-agent updatestartuptty /bye  

alias cat=bat
alias mk=microk8s.kubectl
alias mh=microk8s.helm
