# Personal dotfiles 
Here, you can find many of my linux config files I wish to reuse on different machines.

## Useful links
[r/unixporn](https://www.reddit.com/r/unixporn/comments/wc7b33/i3wm_my_functional_first_rice/)

## First time gitifying .config
We can't use `git clone` since the directory is not empty.
1. cd `~/.config`
2. `git init` then `git add <what you want to add>` and `git commit -m "Initial commit."`.
3. Create a repository on GitHub called `dotfiles`, then `git remote add origin <github-repo>`.
4. Make sure current branch is called `main`. You can use `git branch -m main` to rename master to main.
5. Set tracking information for current branch `main` with `git branch --set-upstream-to=origin/main main`.
6. `git pull`.

## Clone inside .config
1. Inside `/home`, `git clone` the `dotfiles` repository from GitHub: `git clone git@github.com:0nyr/dotfiles.git`
2. Copy all already created dotfiles and dotfolders from the old `.config/` to `dotfiles/` with `cp -r .config/* dotfiles/`.
3. Remove the old `.config/` with `rm -rf .config/`.
4. Rename `dotfiles/` to `.config/` with `mv dotfiles/ .config`.
5. Now, you should have merged the online dotfiles with the already created `.config`.

### Useful Programs
+ Display server: [Xorg](https://wiki.archlinux.org/title/xorg)
+ Window manager: [i3](https://i3wm.org/)
+ Status bar: [Polybar](https://github.com/polybar/polybar)
+ Lock screen: [i3lock](https://github.com/i3/i3lock)
+ Multi-OS live USB: [ventoy](https://www.ventoy.net/en/index.html)

