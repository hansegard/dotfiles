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
	for rc in "$ZDOTDIR/.zshrc.d/*"; do
		if [ -f "$rc" ]; then
			. "$rc"
			echo $rc
		fi
	done
fi

# User config dir
if [ -d "$ZDOTDIR/.function" ]; then
	for rc in "$ZDOTDIR/.function/*"; do
		if [ -f "$rc" ]; then
			echo basename $rc
		fi
	done
fi

autoload -Uz set-prompt
set-prompt