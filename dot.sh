#!/bin/bash

echo ">>= yxqsnz's dotfiles tool."

declare -A dots=(
    ["./conf/shell/fish"]="${HOME}/.config/fish"
    ["./conf/dev/git"]="${HOME}/.config/git"
    ["./conf/editor/astronvim"]="${HOME}/.config/nvim/lua/user"
    
    ["./conf/wm/sway"]="${HOME}/.config/sway"
    ["./conf/wm/mako"]="${HOME}/.config/mako"

    ["./conf/audio/pipewire"]="${HOME}/.config/pipewire"    
    ["./conf/bar/i3status"]="${HOME}/.config/i3status"

    ["./conf/terminal/foot"]="${HOME}/.config/foot"
    ["./conf/dev/cargo/config.toml"]="${HOME}/.cargo/config.toml"
)

fs.exists() {
    test -d "$1" || test -f "$1" || readlink >/dev/null 2>/dev/null "$1"
}

fs.parent_dir_exists() {
   fs.exists "$(dirname $1)"
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

        if ! fs.parent_dir_exists "$val"
        then
            mkdir "$(dirname $val)"
        fi


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

