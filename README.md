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

1. `bin/setup.sh` Installs Homebrew, pip3, Ansible to automate the rest.
2. `rake install` Creates symlinks for dotfiles.

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

Tsukuyomi

- https://github.com/Quramy/tsuquyomi/pull/205

Youtube Downloader (`ytdl`) - OBSOLETE.

- You have Python 3.
- Install youtube-dl like this: `pip3 install youtube-dl`
- To download: `python3 /usr/bin/youtube-dl "https://www.youtube.com/watch?v=V8DyqAr_QBs&ab_channel=KylaVillanueva"`.

Just use: `YT-DLP` since the first one throttles. [Reference](https://github.com/yt-dlp/yt-dlp)
