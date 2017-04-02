dotfiles
========

A set of configuration files

## .bashrc

Add to `~/.bashrc`:

```
export EDITOR=vim
```

```
export TERM="xterm-255color"
```

```
export PATH=/home/user/tmux_configurations/:$PATH
```

```
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
```
