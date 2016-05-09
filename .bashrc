# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

for file in /etc/bash_completion.d/* ; do
  source "$file"
done

[ -n "$PS1" ] && source ~/.bash_profile

if [[ -f $HOME/.bash_profile ]]; then
  source $HOME/.bash_profile
fi
# Copyright (c) npm, Inc. and Contributors
# All rights reserved.

###-begin-todo-completion-###
### credits to npm, this file is coming directly from isaacs/npm repo
#
# Just testing for now. (trying to learn this cool stuff)
#
# npm command completion script
#
# Installation: todo completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _todo_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           todo completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _todo_completion todo
elif type compctl &>/dev/null; then
  _todo_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       todo completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  # if the completer function returns on matches, default
  # to filesystem matching
  compctl -K _todo_completion + -f + todo
fi
###-end-todo-completion-###

