if [ (tty) = "/dev/tty1" ]
        export SDL_VIDEODRIVER=x11
        export _JAVA_AWT_WM_NONREPARENTING=1
        export QT_QPA_PLATFORM=wayland
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_DESKTOP=sway
        export MAN_DISABLE_SECCOMP=1
        export MOZ_ENABLE_WAYLAND=1
        export MOZ_DBUS_REMOTE=1
      	export GTK_IM_MODULE=fcitx
      	export QT_IM_MODULE=fcitx
     	  export XMODIFIERS=@im=fcitx
	      export GLFW_IM_MODULE=ibus
      	export SDL_IM_MODULE=fcitx

        /usr/bin/cat /usr/bin/waybar >/dev/null	
      	# https://raw.githubusercontent.com/geezee/pacman-terminal/master/pacman.c
        pacman-ghosts

        exec sway
  end
