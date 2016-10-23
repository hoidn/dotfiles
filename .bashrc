# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. ~/.profile
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export GPU_MAX_ALLOC_PERCENT=100

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/anaconda2/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/anaconda/bin:$PATH"

PS1='\[\e[0;32m\]\u \h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
# -- Improved X11 forwarding through GNU Screen (or tmux).
# If not in screen or tmux, update the DISPLAY cache.
# If we are, update the value of DISPLAY to be that in the cache.
function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display.txt
    else
        export DISPLAY=`cat ~/.display.txt`
    fi
}

# This is run before every command.
preexec() {
    # Don't cause a preexec for PROMPT_COMMAND.
    # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return 

    update-x11-forwarding

    # Debugging.
    #echo DISPLAY = $DISPLAY, display.txt = `cat ~/.display.txt`, STY = $STY, TMUX = $TMUX  
}
trap 'preexec' DEBUG


# Set default editor
export EDITOR=nvim

# Initialize fasd
eval "$(fasd --init auto)"

#_fasd_bash_hook_cmd_complete v m j o

## Set up custom fasd aliases
#alias fv='fasd -e vim' # quick opening files with vim
#alias sv='fasd -sie vim' # quick opening files with vim

# Collect and immediately reload commands from all shells into bash history:
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# with fasd (from examples page in the fzf repo)
v() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && $EDITOR "${file}" || return 1
}

# change to directory with fasd | fzf
c() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# open in vim with fzf search on results from locate and find. Defaults to searching local directory.
vf() {
	local dir
	local file
	if [ -z "$1" ]
	then
		dir=$PWD
	else
		dir=$1
	fi
	file="$({ locate $dir & find $dir & } 2>/dev/null | uniq | fzf -1 -0 --no-sort +m)" && history -s "vi ${file}" && $EDITOR "${file}" || return 1
}

# open with xdg-open based on results from locate and find. Defaults to searching local directory.
xo() {
	local dir
	local file
	if [ -z "$1" ]
	then
		dir=$PWD
	else
		dir=$1
	fi
	file="$({ locate $dir & find $dir &  } 2>/dev/null | uniq | fzf -1 -0 --no-sort +m)" && history -s "xdg-open ${file}" && xdg-open "${file}" || return 1
	echo $dir
}

# utility function used to write the command in the shell
writecmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}

# fh - repeat history
fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd -run
}

# fhe - repeat history edit
fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}

#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa

alias l='locate $PWD | fzf'
alias r=ranger

# problematic for non-interactive sessions?
#bind -r '\C-s'
#stty -ixon
