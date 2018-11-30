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

function find-translation
{
  if [[ $1 == '-h' ]]; then
    echo 'Available options are "i" and "s":'
    echo ' - findtranslation String   => exact match for "String"'
    echo ' - findtranslation String i => case insensitive match for "string"'
    echo ' - findtranslation String s => case insensitive substring match "string"'
    return
  fi

  needs_yamljs=false
  ls /usr/local/lib/node_modules | grep yamljs >/dev/null 2>&1 || { needs_yamljs=true; }

  if $needs_yamljs; then
    echo 'You need `yamljs` installed. Can I install it for you globally? [Y/N]'
    read allow_install

    if [[ $allow_install == [yY] ]]; then
      npm install -g yamljs
    else
      echo "Ok. You'll need to install it yourself to use this."
      echo "Aborting."
      return;
    fi
  fi

  need_script=false
  if [ ! -f ./t-path.js ]; then
    echo ""
    echo "Script not found. Adding…"
    addFindTranslationFile
    need_script=true
  fi

  echo ""
  echo "Searching for string '$1'"…
  echo ""
  if [ -z "$2" ]; then
    FIND="$1" NODE_PATH=/usr/local/lib/node_modules node t-path.js
  else
    FIND="$1" MODE="$2" NODE_PATH=/usr/local/lib/node_modules node t-path.js
  fi
  echo ""

  if $need_script; then
    echo "Removing added script…"
    rm ./t-path.js
  fi
}

function addFindTranslationFile
{
cat >"./t-path.js" <<'ENDOFSCRIPT'
const mode = process.env.MODE || 'strict';
const YAML = require('yamljs');
const fs = require('fs');
const toFind = process.env.FIND || 'Edit';


let yamlTxt = fs.readFileSync('./config/locales/client.en.yml', { encoding: 'utf8' });
let json = YAML.parse(yamlTxt);

let strings = findStrPath(toFind, json);
if (strings.length === 0) {
  console.log(`Could not find the string "${ toFind }".`);
} else if (mode === 'i') {
  console.log(`Found the case-insensitive string "${ ss(toFind) }" within these locations:`);
} else if (mode === 's') {
  console.log(`Found the string "${ ss(toFind) }" within these locations:`);
} else {
  console.log(`Found the exact string "${ toFind }" at these locations:`);
}
strings.forEach(str => console.log(`- ${str}`));

function findStrPath(toFind, obj, atPath = '') {
  let keys = Object.keys(obj);
  let found = [];

  keys.forEach(key => {
    let value = obj[key] || '';
    let path = atPath ? `${atPath}.${key}` : key;
    if (typeof value === 'string') {
      if ((mode === 's' && ss(value).includes(ss(toFind)))
       || (mode === 'i' && (value.toLowerCase() === toFind.toLowerCase()))
       || (mode === 'strict' && (value === toFind))) {
        found.push(path);
      }
    } else {
      found = found.concat(findStrPath(toFind, value, path));
    }
  });

  return found;
}

function ss(str) {
  return str.trim().replace(/[ \n\t\r]+/g, '').toLowerCase();
}
ENDOFSCRIPT
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh