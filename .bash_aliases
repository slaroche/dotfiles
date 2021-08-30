# ~/.bash_aliases

alias venv='dir=$(git rev-parse --show-toplevel) && source $dir/venv/bin/activate 2>/dev/null || echo "no venv"'

alias tf='terraform'

if [ -f ~/.bash_flare_aliases ]; then
    . ~/.bash_flare_aliases
fi

