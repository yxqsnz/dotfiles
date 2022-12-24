if test -d ~/.asdf 
  source ~/.asdf/asdf.fish
  if not test -f ~/.config/fish/completions/asdf.fish
    mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
  end
end
