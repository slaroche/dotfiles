# enable colors and change prompt
export CLICOLOR=1
autoload -U colors && colors
PS1="%1~ > "

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
setopt appendhistory

XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# my config

# aliases
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"

alias venv='dir=$(git rev-parse --show-toplevel) && source $dir/venv/bin/activate 2>/dev/null || echo "no venv"'
alias ll="ls -al"
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

