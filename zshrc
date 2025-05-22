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
source $HOME/Documents/rails-projects/dotfiles/zsh/aliases
source $HOME/Documents/rails-projects/dotfiles/zsh/functions

# Source prompt
source $HOME/Documents/rails-projects/dotfiles/zsh_prompt
source ~/.bin/tmuxinator.zsh

# Source cdpath
cdpath=($HOME/Documents/rails_projects $HOME/Desktop/trainer)

# PATH stuff
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="$HOME/.rbenv/bin:$PATH"

# Install rbenv first
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"

# Install pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Install psql@15 first - this is only for Supabase
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/bin:$PATH"

# autojump is for doing `j d__` which goes to this dotfiles directory
[[ -s /Users/daryll/.autojump/etc/profile.d/autojump.sh ]] && source /Users/daryll/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# pnpm
export PNPM_HOME="/Users/daryll/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# auto-suggestions and syntax-highlighting - msut be at the end
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"
