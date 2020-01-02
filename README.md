# Config files for my custom environment

## bash-it
install `bash-it`

```
$ git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
```

```
$ ~/.bash_it/install.sh -s
```

```
$ cat dot-bashrc >> ~/.bashrc
```

```
$ bashit enable plugin ssh tmux go git
```

## awesome-vimrc

```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

# copy my config files

```
cp dot-bashrc ~/.bashrc
cp bash_it-custom.bash ~/.bash_it/custom/custom.bash
cp dot-kube.tmux ~/.kube.tmux
```