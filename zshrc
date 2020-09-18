#SOLARIZED_THEME=light
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="superjarin"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode rvm git)

source $ZSH/oh-my-zsh.sh
# load aliases
source $HOME/.aliases

#export RUBYOPT="-ropenssl"
export LANG="en_US.UTF-8"

export EDITOR="nvim"
export ALTERNATE_EDITOR="nvim"
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
# This is important if you'd like to use TrueColor themes in Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# This makes Neovim your default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

export REVIEW_BASE=develop

# unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

unsetopt correct_all

export TERM=xterm-256color

eval "$(direnv hook zsh)"

# Customize to your needs...
# export PATH=~/bin:/usr/local/Cellar/bin:/usr/local/sbin:/Users/cezar/.rvm/bin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local

fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)

source ~/.fzf.zsh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

autoload -U promptinit && promptinit
prompt pure

# optionally define some options

# Kill the lag
export KEYTIMEOUT=1 # that's 0.1

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

export DEVELOPER=chalmagean
export PG_DATABASE_HOST=localhost
export PG_DATABASE_USERNAME=$USER
export PG_DATABASE_PASSWORD=

# export PATH="$PATH:$HOME/.local/bin"
source ~/.profile

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Haskell PATH
export PATH="$PATH:$HOME/.local/bin"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

