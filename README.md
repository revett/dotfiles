# dotfiles

macOS .files and configuration.

## Install

Clone the repo:

```
git clone -C ~/projects/github.com/revett git@github.com:revett/dotfiles.git
```

Symlink to the home directory:

```
ln -sf ~/projects/github.com/revett/dotfiles ~/dotfiles
```

## Usage

Symlink the files within the repo:

```
make run
```

### Email Filtering

Used to automatically label unknown external emails within GMail, to reduce
noise/spam:

```
make generate-email-filters
```

> **Note** - Wrapping the output in `from:(foo)` will allow the filters to be
> used as search queries.

## Docker Images

Within `docker/` are a number of wrapper container images for making local
development simpler.

```
make build-container-images
```

## Thanks

- Jeff Geerling - [geerlingguy/dotfiles](https://github.com/geerlingguy/dotfiles)
- Marko Wallin - [walokra/dotfiles](https://github.com/walokra/dotfiles)
- Mathias Bynens - [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
