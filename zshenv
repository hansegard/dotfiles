export EDITOR="nvim"
export VISUAL="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$XDG_CACHE_HOME/.zhistory"
export HISTSIZE=1000
export SAVEHIST=1000

# Set pyenv vars if it exist
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

# Set pyenv vars if it exist
if [ -d "$ZDOTDIR/.function" ]; then
    export FPATH="$ZDOTDIR/.function:$FPATH"
fi