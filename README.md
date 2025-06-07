## Dotfiles :computer:

Forked from [Ben Orenstein](http://github.com/r00k).

vim, zsh, tmux, pry

## Installation Process

```shell
# TLDR
$ git clone git://github.com/daryllxd/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ bin/setup.sh
$ rake install
```

## 2025 process

1. `bin/setup.sh` # Installs Homebrew, pip3, Ansible to automate the rest.
2. `rake install` # Creates symlinks for dotfiles.
3. `just start` # Starts a tmux session for editing

Vim plugins are managed through vundle. You'll need to install vundle to get them.

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Run `:BundleInstall` in vim.

## Notes from last time this got set up

- Iterm font: Inconsolata.
- Iterm color theme: Tango Dark.

Karabiner (can also check karabiner.json) in this file:

[Reference](https://github.com/pqrs-org/Karabiner-Elements/issues/1225#issuecomment-735239193)

```
{
  "title": "Ctrl-Shift-Q to Enter",
  "rules": [
    {
      "description": "Ctrl-Shift-Q to Enter",
      "manipulators": [
        {
          "type": "basic",
          "from": {
            "key_code": "q",
            "modifiers": {
              "mandatory": [
                "control",
                "left_shift"
              ]
            }
          },
          "to": [
            {
              "key_code": "return_or_enter"
            }
          ]
        }
      ]
    }
  ]
}
```
