 # Get the aliases and functions
 if [ -f ~/.bashrc ]; then
         . ~/.bashrc
 fi
. "$HOME/.cargo/env"
export PATH="$HOME/perl5/bin:$PATH"
export PERL5LIB="$HOME/perl5/lib/perl5:$PERL5LIB"

eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ollie/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ollie/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ollie/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ollie/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

