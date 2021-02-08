# Config files for my custom environment

## bash-it
install `bash-it`

```console
$ git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
```

```console
$ ~/.bash_it/install.sh -s
```

```console
$ cat dot-bashrc >> ~/.bashrc
```

```console
$ bashit enable plugin ssh tmux go git
```

## Enable completions
Put the desired completions into ~/.bash_it/completions/available
```console
kubectl completion bash > ~/.bash_it/completion/available/kubectl.completion.bash
```

And enable them
```console
bash_it enable completion ssh virsh github-cli go docker-compose docker awscli gcloud vault flux helm k3d kubectl skaffold tmux
```


## awesome-vimrc

```console
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

# copy my config files

```console
cp dot-bashrc ~/.bashrc
cp bash_it-custom.bash ~/.bash_it/custom/custom.bash
cp dot-kube.tmux ~/.kube.tmux
```