# Set editors
export EDITOR="nvim"
export VISUAL="nvim"

# Set XDG env vars
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History definition
export HISTFILE="$XDG_CACHE_HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Autosuggest settings
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set pyenv vars if it exist
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi