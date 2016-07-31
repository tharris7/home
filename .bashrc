#!/usr/local/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#bind Space:magic-space
#umask 0077

# User specific aliases and functions

alias l='less'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias x='exit'
alias q='exit'
alias c='clear'
alias aw='ps aux | grep apache'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

#-------------------------------------------------------------
# git aliases
#-------------------------------------------------------------
alias g='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias ga='git add --update'
alias gc='git commit -v -m'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.

alias ct="cd /c/work/counselling-trac"

#if [ -n "${DISPLAY+x}" ]; then
#    xmodmap ~/.speedswapper
#fi
