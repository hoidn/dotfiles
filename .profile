# TODO: make this run zsh in terminal, bash in emacs
#preferred_shell=
## if [ -x /bin/zsh ]; then
# if [ -x /bin/zsh ] && [[ -z ${INSIDE_EMACS} ]]; then
#  preferred_shell=/bin/zsh
#fi
#
#if [ -n "$preferred_shell" ]; then
#  case $- in
#    *i*) SHELL=$preferred_shell; export SHELL; exec "$preferred_shell";;
#  esac
#fi

. "$HOME/.cargo/env"
