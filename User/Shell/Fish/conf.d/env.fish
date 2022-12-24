set -gx EDITOR nvim

set -gx PATH /sbin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH 

set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK /run/user/1000/keyring/ssh
