# shell alias

## duckduckgo on w3m
alias ddg='w3m duckduckgo.com'

## git dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

## ls
alias la='ls -la'
alias ll='ls -l'

## taskwarrior

alias tw='task'
alias twa='task active'
alias twc='task calendar'
alias twfull='clear;twc;twa;tws;twn;tww'
alias twh='task priority:H'
alias twl='task priority:L'
alias twm='task priority:M'
alias twn='task next'
alias two='task overdue'
alias twp='task projects'
alias tww='task waiting'
alias twi='task add wait:later +inbox'
alias twinbox='task waiting +inbox'
alias tws='task summary'

# shell options

## vi keybindings
set -o vi
