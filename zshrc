# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Enable completion
autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# Sourcing of other files
# source $HOME/.dotfiles/zsh/aliases
source $HOME/Documents/rails_projects/dotfiles/zsh/aliases
source $HOME/Documents/rails_projects/dotfiles/zsh/functions

# Source prompt
source $HOME/Documents/rails_projects/dotfiles/zsh_prompt
source ~/.bin/tmuxinator.zsh

# Source cdpath
cdpath=($HOME/Documents/rails_projects $HOME/Desktop/trainer)

# PATH stuff
export PATH=bin:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/scripts
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/qt5/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
