# Environment variables
export CLICOLOR=1
export EDITOR=vim
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# enable colors and change prompt
autoload -U colors && colors
setopt PROMPT_SUBST

# direnv and venv prompt
# show_virtual_env() {
#   if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
#     echo "${VIRTUAL_ENV_PROMPT} | "
#   fi
# }
# PS1='$(show_virtual_env)%~ > '

autoload -Uz promptinit
promptinit
prompt redhat

# history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt histignorealldups

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# zsh syntax highlighting
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# zsh autosuggestions
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  bindkey '^ ' autosuggest-accept
fi

# aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

alias ll='ls -al --color'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# homebrew
export PATH="/opt/homebrew/bin:$PATH"

# homebrew completion
# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#
#   autoload -Uz compinit
#   compinit
# fi

# eval "$(/opt/homebrew/bin/brew shellenv)"
# if type brew &>/dev/null; then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#   autoload -Uz compinit
#   compinit
# fi

# poetry
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# direnv
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# rust
# . "$HOME/.cargo/env"

#docker
export PATH="/Applications/Docker.app/Contents/Resources/bin/:$PATH"

# go
export PATH="$PATH:$HOME/go/bin"

# nim
export PATH="$PATH:$HOME/.nimble/bin"

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"
