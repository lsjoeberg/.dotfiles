# -- HISTORY --
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# -- SHELL: STARSHIP --
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# -- PLUGINS: ANTIDOTE --
if [ -f ~/.antidote/antidote.zsh ]; then
    source ~/.antidote/antidote.zsh
    antidote load
fi

# -- ALIASES --
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# -- SHELL HOOKS --

# init fzf
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# init zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# init direnv
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# nord dircolors
if [ -r ~/.dir_colors ]; then
    eval "$(dircolors "$HOME/.dir_colors")"
fi

# completions
autoload -U compinit; compinit
