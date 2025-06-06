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
source ~/.config/tmuxinator.zsh

# autojump configuration
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Source cdpath
cdpath=($HOME/Documents/rails_projects $HOME/Desktop/trainer)

# PATH stuff
export ERL_AFLAGS="-kernel shell_history enabled"

# Install psql@15 first - this is only for Supabase
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/daryll/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# auto-suggestions and syntax-highlighting - must be at the end
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# asdf configuration
. $(brew --prefix asdf)/libexec/asdf.sh
