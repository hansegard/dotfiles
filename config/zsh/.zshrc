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

## User functions
if [ -d "$ZDOTDIR/.function" ]; then
	# Setup fpath
	fpath=("$ZDOTDIR/.function" $fpath)
	for function_path in "$ZDOTDIR/.function"/*; do
		if [ -f "$function_path" ]; then
			function_name=$(basename "$function_path")
			autoload -Uz "$function_name"
			"$function_name"
		fi
	done
fi