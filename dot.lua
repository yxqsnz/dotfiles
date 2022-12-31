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
  return os.execute(string.format('[[ -f %s ]] || [[ -d %s ]] || readlink "%s" >/dev/null', name, name, name))
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
    name = "Sway",
    path = "WindowManager/sway",
    target = "~/.config/sway",
  },

  {
    name = "Fish",
    path = "Shell/Fish",
    target = "~/.config/fish",
  },

  {
    name = "Alacritty",
    path = "Terminal/Alacritty",
    target = "~/.config/alacritty",
  },

  {
    name = "Waybar",
    path = "WindowManager/waybar",
    target = "~/.config/waybar",
  },

  {
    name = "Mako",
    path = "WindowManager/mako",
    target = "~/.config/mako",
  },

  {
    name = "DOOM Emacs",
    path = "Editor/Doom-Emacs",
    target = "~/.doom.d",
  },

  {
    name = "Kitty",
    path = "Terminal/Kitty",
    target = "~/.config/kitty"
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
