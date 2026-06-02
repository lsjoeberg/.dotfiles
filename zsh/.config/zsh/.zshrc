# -- HISTORY --
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

ZCFG="${ZDOTDIR:-$HOME}"

# -- SHELL: STARSHIP --
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# -- PLUGINS: ANTIDOTE --
if [ -f "$ZCFG/.antidote/antidote.zsh" ]; then
    source "$ZCFG/.antidote/antidote.zsh"
    antidote load
fi

# -- ALIASES --
if [ -f "$ZCFG/.zsh_aliases" ]; then
    source "$ZCFG/.zsh_aliases"
fi

# -- KEY BINDINGS --

# Since EDITOR is set to 'nvim', 'vim', or 'vi' in .zshenv, the shell will be
# viins mode on startup, which doesn't provide a key-binding to the widget.
bindkey -M viins '\e.' insert-last-word

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
if [ -r "$ZCFG/.dir_colors" ]; then
    eval "$(dircolors "$ZCFG/.dir_colors")"
fi

# completions
autoload -U compinit; compinit

# zola on fedora
if flatpak info org.getzola.zola >/dev/null 2>&1; then
    alias zola='flatpak run org.getzola.zola'
fi
