# Personal dotfiles 
Here, you can find many of my linux config files I wish to reuse on different machines.

## Useful links
[r/unixporn](https://www.reddit.com/r/unixporn/comments/wc7b33/i3wm_my_functional_first_rice/)

## Clone inside .config
We can't use `git clone` since the directory is not empty.
1. cd `~/.config`
2. `git init`
3. `git remote add origin <github-repo>`.
4. Make sure current branch is called `main`.
5. Set tracking information for current branch `main` with `git branch --set-upstream-to=origin/main main`.
6. `git pull`.

### Program doc
+ Display server : [Xorg](https://wiki.archlinux.org/title/xorg)
+ Window manager : [i3](https://i3wm.org/)
+ Status bar : [Polybar](https://github.com/polybar/polybar)
+ Lock screen : [i3lock](https://github.com/i3/i3lock)



