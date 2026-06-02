# ----------------------------------------------------------------------------
# .zshenv is always sourced first.
# It often contains exported variables that should be available to other
# programs. For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv.
# Also, $ZDOTDIR can be set in .zshenv to specify an alternative location for
# the rest of the zsh configuration.
# ----------------------------------------------------------------------------

# -- ZDOTDIR: All zsh config files should be stored here --
export ZDOTDIR="$HOME/.config/zsh"

# -- PATH --
export PATH="$PATH:$HOME/.local/bin:$HOME/bin"

# neovim: manual install; e.g. '/opt/nvim-{linux,macos}-x86_64'
nvim_install_dir="$(find /opt -maxdepth 1 -type d -name 'nvim-*')"
if [ -d "$nvim_install_dir/bin" ]; then
    export PATH="$PATH:$nvim_install_dir/bin"
fi

# -- EDITOR --
#
# From man zshzle:
# If one of the VISUAL or EDITOR environment variables contain the string 'vi'
# when the shell starts up then it will be viins, otherwise it will be emacs.
# bindkey's -e and -v options provide a convenient way to override this default
# choice.
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=vi
fi
