if [ $(tty) = "/dev/tty1" ]
then
	exec startx
fi

export PATH="$PATH:${HOME}/.local/bin"

# Wasmer
export WASMER_DIR="${HOME}/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# asdf
if [ -d "${HOME}/.asdf" ]; then
	source "$HOME/.asdf/asdf.sh"
	fpath+=${ASDF_DIR}/completions
fi
# asdf end

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

source ~/.zshrc-opts
source ~/.zshrc-theme
source ~/.zshrc-alias


