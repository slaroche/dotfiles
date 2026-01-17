# enable colors and change prompt
export CLICOLOR=1
autoload -U colors && colors
PS1="%~ > "

setopt PROMPT_SUBST

# direnv and venv prompt
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "$VIRTUAL_ENV_PROMPT | "
  fi
}
PS1='$(show_virtual_env)'$PS1

# history
HISTSIZE=1000
SAVEHIST=1000
# HISTFILE=~/.cache/zsh/history
setopt appendhistory

XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

alias l='ls -al --color'
alias ll="ls -al --color"
alias venv='dir=$(git rev-parse --show-toplevel) && source $dir/venv/bin/activate 2>/dev/null || echo "no venv"'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion     

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# zsh autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Enable homebrew completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# poetry
export PATH="/Users/slaroche/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# rust
. "$HOME/.cargo/env"

#docker
export PATH="/Applications/Docker.app/Contents/Resources/bin/:$PATH"

# editor
export EDITOR=vim

# go 
export PATH="$PATH:$HOME/go/bin"

# nim 
export PATH="$PATH:$HOME/.nimble/bin"
