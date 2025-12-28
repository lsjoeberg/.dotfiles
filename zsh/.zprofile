# --- .zprofile (read at login) -----------------------------------------------
# Like .zshenv but for commands and variables which should be set once or which
# don't need to be updated frequently. For instance, environment variables to
# configure tools or configuration which execute commands, as it may take some
# time to execute.

# locale
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"

# fzf colors
if command -v fzf >/dev/null 2>&1; then
    export FZF_DEFAULT_OPTS='
        --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
        --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
    '
fi

# go
if [ -d "/usr/local/go" ]; then
    export GOPATH="${HOME}/go"
    export GOBIN="${GOPATH}/bin"
    export PATH="${PATH}:/usr/local/go/bin:${GOBIN}"
fi

# cargo
if [ -f "${HOME}/.cargo/env" ]; then
    source "${HOME}/.cargo/env"
fi

# sccache
if command -v sccache >/dev/null 2>&1; then
    export SCCACHE_DIRECT=true
    export RUSTC_WRAPPER=sccache
fi

# asdf
if command -v asdf >/dev/null 2>&1; then
    export PATH="${PATH}:${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
    fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
fi
