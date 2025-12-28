# Zsh

Shell configuration [load order]:

```txt
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout
```

1. `.zshenv` is _always_ sourced first.
   It often contains exported variables that should be available to other
   programs. For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv.
   Also, you can set $ZDOTDIR in .zshenv to specify an alternative location for
   the rest of your zsh configuration.

2. `.zprofile` is for [login shells].
   According to the zsh documentation, ".zprofile is meant as an alternative to
   .zlogin for ksh fans; the two are not intended to be used together, although
   this could certainly be done if desired."

3. `.zshrc` is for [interactive shells].
   You set options for the interactive shell there with the setopt and unsetopt
   commands. You can also load shell modules, set your history options, change
   your prompt, set up zle and completion, et cetera. You also set any
   variables that are only used in the interactive shell (e.g. $LS_COLORS).

4. `.zlogin` is for [login shells].
   It is often used to start X using startx. Some systems start X on boot, so this file is not always very useful.

5. `.zlogout` is for [login shells].
   It is called when exiting the shell. It is sometimes used to clear and reset
   the terminal.

<!--References-->
[load order]: https://unix.stackexchange.com/a/71258
[login shells]: https://unix.stackexchange.com/a/324391
[interactive shells]: https://unix.stackexchange.com/a/50667
