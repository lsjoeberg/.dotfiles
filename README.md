# dotfiles

Deploy packages selectively, e.g. `nvim`:

```sh
stow -v <pkg>
```

## Prerequisites

- `git`
- `stow`

## Programs

### Terminal

- **Shell**: Zsh
- **Prompt**: [Starship]
- **Emulator**: [Ghostty]
- **Shell package manager**: [Antidote]
- **Editor**: [Neovim] `v0.12+` with [lazy.nvim]

### Essentials

- `bat`
- `eza`
- `fd`
- `fzf`
- `ripgrep`
- `sd`
- `zellij`
- `zoxide`

> [!NOTE]
> The Neovim configuration uses the [lazy.nvim] plugin manager, which has its
> own set of requirements. Some plugins require `luarocks` to install
> `.rockspec` packages. The `checkhealth lazy` command should report whether
> any plugins require these dependencies.
>
> - `tree-sitter-cli`
> - `lua` and `luarocks`

### Utilities

- `btop`
- `direnv`
- `hexyl`
- `jless`
- `jq`
- `lazygit`
- `tailspin`

<!--Links-->
[Starship]: https://starship.rs/
[Ghostty]: https://ghostty.org/
[Antidote]: https://antidote.sh/
[Neovim]: https://neovim.io/
[lazy.nvim]: https://lazy.folke.io/
