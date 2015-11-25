# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

for file in /etc/bash_completion.d/* ; do
  source "$file"
done

[ -n "$PS1" ] && source ~/.bash_profile

if [[ -f $HOME/.bash_profile ]]; then
  source $HOME/.bash_profile
fi
