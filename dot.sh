#!/bin/bash

echo "--> yxqsnz's dotfiles tool."

declare -A dots=(
    ["./conf/zsh/zshrc"]="${HOME}/.zshrc"
    ["./conf/zsh/zshrc-opts"]="${HOME}/.zshrc-opts"
    ["./conf/zsh/zshrc-theme"]="${HOME}/.zshrc-theme"
    ["./conf/zsh/zshrc-alias"]="${HOME}/.zshrc-alias"
    ["./conf/dev/git"]="${HOME}/.config/git"
    ["./conf/wm/sway"]="${HOME}/.config/sway"
    ["./conf/term/alacritty"]="${HOME}/.config/alacritty"
    ["./conf/bar/i3status"]="${HOME}/.config/i3status"
    ["./conf/dev/cargo/config.toml"]="${HOME}/.cargo/config.toml"
)

fs.exists() {
    test -d "$1" || test -f "$1" || readlink >/dev/null 2>/dev/null "$1"
}

if [ -z "$1" ]
then
    echo " $0 install"
    echo " $0 uninstall"
fi


if [ "$1" = "install" ]
then
    echo "[*] installing dotfiles"

    for dot in "${!dots[@]}"
    do
        val="${dots[$dot]}"
        printf "     : ${dot}\r"
        if ! fs.exists "$val"
        then
            printf " done\r"
            ln -s "$(realpath $dot)" "$val"
        else
            printf " skip\r"
        fi

        echo ""
    done
fi

if [ "$1" = "uninstall" ]
then
    echo "[*] uninstalling dotfiles"

    for dot in "${!dots[@]}"
    do
        val="${dots[$dot]}"
        printf "     : ${dot}\r"
        if fs.exists "$val"
        then
            unlink "${val}"
            printf " done\r"
        else
            printf " skip\r"
        fi

        echo ""
    done
fi

