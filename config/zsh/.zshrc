unsetopt beep
bindkey -e

# Bind keys to bash logic
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Completion
autoload -Uz compinit
compinit
_comp_options+=(globdots) # With hidden files

# User config dir
if [ -d "$ZDOTDIR/.zshrc.d" ]; then
	for rc in "$ZDOTDIR/.zshrc.d"/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# Set prompt
fpath=("$ZDOTDIR" $fpath)
autoload -Uz prompt
prompt

## User plugins
if [ -d "$ZDOTDIR/plugins" ]; then
	# Setup fpath
	fpath=("$ZDOTDIR/plugins" $fpath)
	for plugin_path in "$ZDOTDIR/plugins"/*; do
		if [ -f "$plugin_path" ]; then
			plugin_name=$(basename "$plugin_path")
			autoload -Uz "$plugin_name"
		fi
	done
fi