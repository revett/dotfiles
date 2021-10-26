# dotfiles

macOS .files and configuration.

## Usage

Clone the repo and symlink to `~/.dotfiles`:

```bash
git clone git@github.com:revett/dotfiles.git
cd dotfiles
ln -sf ~/projects/github.com/revett/dotfiles ~/.dotfiles
```

Use the bootstrap script to symlink files:

```bash
source bootstrap.sh
```

### Email Filtering

Used to automatically label unknown external emails within GMail, to reduce
noise/spam:

```
make generate-email-filters
```

> **Note** - Wrapping the output in `from:(foo)` will allow the filters to be
> used as search queries.

## Thanks

- Jeff Geerling - [geerlingguy/dotfiles](https://github.com/geerlingguy/dotfiles)
- Marko Wallin - [walokra/dotfiles](https://github.com/walokra/dotfiles)
- Mathias Bynens - [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
