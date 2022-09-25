# dotfiles

Scripts, CLIs and configuration used for my development environment.

## Install

Clone the repo:

```
git clone -C ~/projects/github.com/revett git@github.com:revett/dotfiles.git
```

Create symlinks, and set macOS system preferences:

```
make setup
```

## Other Projects

### Docker Images

Within `docker/` are a number of wrapper container images for making local
development simpler.

```
make build-container-images
```

### Email Filtering

Within `email/` is an allowlist and shell script for generating a Gmail filter
that labels anything not from a trusted domain as `External`; to visually aid
with noise/spam.

```
make generate-email-filters
```

## HomeBrew Package Syncing

> Warning: This is very rough-and-ready.

The `hops` CLI is a simple Go wrapper around the macOS `brew` CLI which uses a
local `.hops.yml` file for keeping which packages are installed/uninstalled in
sync.

```
make build-hops-cli
```

```
./hops
```

## Thanks

- Jeff Geerling - [geerlingguy/dotfiles](https://github.com/geerlingguy/dotfiles)
- Marko Wallin - [walokra/dotfiles](https://github.com/walokra/dotfiles)
- Mathias Bynens - [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
