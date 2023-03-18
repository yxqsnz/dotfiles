if [ "$(tty)" = "/dev/tty2" ]
  set -gx SDL_VIDEODRIVER wayland
	set -gx QT_QPA_PLATFORM wayland
	set -gx XDG_CURRENT_DESKTOP sway
	set -gx XDG_SESSION_DESKTOP sway
	set -gx DESKTOP_SESSION sway
	set -gx MOZ_ENABLE_WAYLAND 1
	set -gx MOZ_DBUS_REMOTE 1
	set -gx _JAVA_AWT_WM_NONREPARENTING 1
	#set -gx WLR_DRM_DEVICES /dev/dri/card1
  exec dbus-run-session sway 
end

