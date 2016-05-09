# .bash_profile

# Add `~/bin` and `~/.local/bin` to `$PATH`
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.rvm/bin

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,csw,exports,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

 # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to history file, rather than overeriting it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# Used in conjunction with ~/.ssh/config while ignoring entries in ~/.ssh/know_hosts
# Without the command bellow SSH will provide some garbage targets on tab completion
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
