## Dotfiles :computer:

Forked from [Ben Orenstein](http://github.com/r00k).

vim, zsh, tmux, pry

#### Installation

    git clone git://github.com/r00k/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install

Vim plugins are managed through vundle. You'll need to install vundle to get them.

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Run :BundleInstall in vim.


## Notes from last time this got set up

- `Ultisnips` Error - this is cause got no Python. Just `brew install python3` and `brew install vim` and link your Homebrew Vim instead of your system vim.
- If Snippets are missing [Reference](https://stackoverflow.com/questions/37511063/why-ultisnips-does-not-recognize-my-own-snippets), then check `~/.vim/bundle/vim-snippets/UltiSnips/` directory.

```
To enable snippet on Markdown:
snippet [r
[Reference](${1:link})
endsnippet
```
