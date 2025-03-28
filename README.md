## Dotfiles :computer:

Forked from [Ben Orenstein](http://github.com/r00k).

vim, zsh, tmux, pry

#### Installation

    git clone git://github.com/daryllxd/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install

Vim plugins are managed through vundle. You'll need to install vundle to get them.

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Run :BundleInstall in vim.


## Notes from last time this got set up

- Iterm font: Inconsolata.
- Iterm color theme: Tango Dark.
- `Ultisnips` Error - this is because there is no Python.
  - `brew install python3`
  - `brew install vim`
  - Open new terminal or reload terminal. `homebrew vim` should be loaded, not the system one.
- If Snippets are missing [Reference](https://stackoverflow.com/questions/37511063/why-ultisnips-does-not-recognize-my-own-snippets), then check `~/.vim/bundle/vim-snippets/UltiSnips/` directory.
- Specifically, `/snippets/javascript/javascript.snippets`.
```
To enable snippet on Markdown:
snippet [r
[Reference](${1:link})
endsnippet
```

`Ultisnips directory: ~/.vim/bundle/vim-snippets/UltiSnips/`

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
