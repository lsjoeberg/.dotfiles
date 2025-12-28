# --- .zshenv (read every time) -----------------------------------------------
# This file is always sourced, so it should set environment variables which need
# to be updated frequently. By setting variables in this file, reopening a
# terminal emulator will start a new Zsh instance with the value updated.
#
# Note: This file is read even when Zsh is launched to run a single command
# (with the -c option), even by another tool like make.

# -- PATH --
export PATH="$PATH:$HOME/.local/bin:$HOME/bin"

# neovim: manual install; e.g. '/opt/nvim-{linux,macos}-x86_64'
nvim_install_dir="$(find /opt -maxdepth 1 -type d -name 'nvim-*')"
if [ -d "$nvim_install_dir/bin" ]; then
    export PATH="$PATH:$nvim_install_dir/bin"
fi

# -- EDITOR --
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

# From man zshzle:
# If one of the VISUAL or EDITOR environment variables contain the string 'vi'
# when the shell starts up then it will be viins, otherwise it will be emacs.
# bindkey's -e and -v options provide a convenient way to override this default
# choice.
bindkey -e
