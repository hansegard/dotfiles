export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE=$HOME/.zhistory
export HISTSIZE=1000
export SAVEHIST=1000

# Set pyenv vars if it exist
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
