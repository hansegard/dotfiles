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
if [ -d ~/.zshrc.d ]; then
        for rc in ~/.zshrc.d/*; do
        	if [ -f "$rc" ]; then
                	. "$rc"
        	fi
	done
fi
