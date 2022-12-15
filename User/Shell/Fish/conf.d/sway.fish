if [ (tty) = "/dev/tty1" ]
        export SDL_VIDEODRIVER=x11
        export _JAVA_AWT_WM_NONREPARENTING=1
        export QT_QPA_PLATFORM=wayland
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_DESKTOP=sway
        export MAN_DISABLE_SECCOMP=1
        export MOZ_ENABLE_WAYLAND=1
        export MOZ_DBUS_REMOTE=1

        exec sway
  end
