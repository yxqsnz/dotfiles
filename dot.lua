function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

local function mklink(source, target)
  return os.execute(string.format("ln -s %s %s", source, target))
end

local function exists(name)
  return os.execute(string.format('test -f %s  || test -d %s  || readlink "%s" >/dev/null', name, name, name))
end

local function realpath(path)
  return os.capture("realpath " .. path, false)
end

local dots = {
  {
    name = "Git",
    path = "Dev/Git",
    target = "~/.config/git",
  },

  {
    name = "Cargo",
    path = "BuildTools/Cargo.toml",
    target = "~/.cargo/config.toml",
  },

  {
    name = "DOOM Emacs",
    path = "Editor/Doom-Emacs",
    target = "~/.doom.d",
  },

  {
    name = "Z-Shell RC",
    path = "Shell/Z-Shell/.zshrc",
    target = "~/.zshrc",
  },

  {
    name = "Z-Shell Theme",
    path = "Shell/Z-Shell/.zshrc-theme",
    target = "~/.zshrc-theme",
  },

  {
    name = "Z-Shell Options",
    path = "Shell/Z-Shell/.zshrc-opts",
    target = "~/.zshrc-opts",
  },

  {
    name = "Z-Shell Alises",
    path = "Shell/Z-Shell/.zshrc-alias",
    target = "~/.zshrc-alias",
  },

  {
	  name = "Xorg (InitRC)",
	  path = "X11/Xresources",
	  target = "~/.Xresources"
  },

  {
	  name = "Xorg (Resources file)",
	  path = "X11/xinitrc",
	  target = "~/.xinitrc"
  },

  {
	  name = "Alacritty",
	  path = "Terminal/Alacritty",
	  target = "~/.config/alacritty"
  },

  {
	  name = "i3-wm",
	  path = "WindowManager/i3",
	  target = "~/.config/i3"
  }
}

print(":: Installing")

for i, item in pairs(dots) do
  io.write(string.format("  : linking %s\r", item.name))
  local path = "User/" .. item.path

  if not exists(item.target) then
    print(" S\r")

    mklink(realpath(path), item.target)
  else
    print(" I\r")
  end
end
