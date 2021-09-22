# dotfiles

🔧 .files, configuration and tooling.

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

## Email Filtering

Used to automatically label unknown external emails within GMail, to reduce
noise/spam:

```bash
email-vidsy-allowlist | pbcopy
```

```go
// -1310.io -1password.com -agilebits.com -airtableemail.com -amazon.com ...
```

Used to automatically dispose of recruiter emails, to reduce noise/spam:

```bash
email-recruiter-blocklist | pbcopy
```

> **Note** - Wrapping the output in `from:(foo)` will allow the filters to be
> used as search queries.

## Thanks

- [Mathias Bynens](https://mathiasbynens.be) - [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
