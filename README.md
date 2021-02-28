# dotfiles

🔧 .files, configuration and tooling.

## Usage

Clone the repo and symlink to `~/.dotfiles`:

```bash
git clone git@github.com:revett/dotfiles.git
cd dotfiles
ln -sf ~/Projects/github.com/revett/dotfiles ~/.dotfiles
```

Use the bootstrap script to symlink files:

```bash
source bootstrap.sh
```

## Files

| Directory / File   | Description                                                     |
|--------------------|-----------------------------------------------------------------|
| `.aliases`         | Bash aliases, sourced in `.zshrc`                               |
| `bootstrap.sh`     | Bash script for initialising and updating repo symlinks         |
| `Brewfile`         | Homebrew dump                                                   |
| `.functions`       | Bash functions, sourced in  `.zshrc`                            |
| `.gitconfig`       | Global git config                                               |
| `.gitignore`       | Global git ignore                                               |
| `karabiner.json`   | [Karabiner](https://karabiner-elements.pqrs.org/) configuration |
| `mtmr.json`        | [MTMR](https://github.com/Toxblh/MTMR) configuration            |
| `.vimrc`           | Vim configuration                                               |
| `.vscode/`         | Directory holding VSCode configuration and extensions list      |
| `.zshrc`           | Zsh configuration file                                          |

## Thanks

* [Mathias Bynens](https://mathiasbynens.be) - [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Flavio Gasperini](https://unsplash.com/@flaviewxvx) for the [wallpaper](https://unsplash.com/photos/GjKPTkhni6Y)
