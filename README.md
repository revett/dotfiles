<img src="./banner.jpg" width="100%" alt="Uncle Iroh doing his thing" />

# dotfiles

Configuration used for my development environment.

## Install

```bash
./install.sh
./macos.sh
```

Clone/download the repo, create symlinks, and set macOS system preferences.

## Homebrew

I wrote [revett/hops](https://github.com/revett/hops) as a lightweight CLI to wrap `brew bundle`
commands to help with managing installing packages across work/personal machines, see
[hops.yml](./hops.yml).

## Todo

- [ ] HTML explainer skill
- [ ] Address GitHub PR comments skill
- [ ] Add default output (i.e. in chat) destination for Claude
- [ ] Add preferred output format (i.e. ranked, scored, grouped etc) for Claude
- [ ] Update `permissions.deny` list for Claude
- [ ] Set up status line for Claude
- [ ] Improve cmux status tracking of Claude within sidebar
- [ ] Handle deleting empty skill directories within `install.sh`
- [ ] Remove old skill marketplaces

## Thanks

- Jeff Geerling - [geerlingguy/dotfiles](https://github.com/geerlingguy/dotfiles)
- Marko Wallin - [walokra/dotfiles](https://github.com/walokra/dotfiles)
- Mathias Bynens - [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Christopher Allen](https://github.com/ChristopherA) for his
  [gist](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f) on Brewfile best
  practices
