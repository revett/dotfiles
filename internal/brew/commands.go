package brew

// AutoRemove uninstalls formulae that were only installed as a dependency of
// another formula and are now no longer needed.
func AutoRemove() ArgumentsOption {
	return func() []string {
		return []string{"autoremove"}
	}
}

// Casks lists all locally installable casks including short names.
func Casks() ArgumentsOption {
	return func() []string {
		return []string{"list", "--casks", "-1"}
	}
}

// Cleanup removes stale lock files and outdated downloads for all formulae and
// casks, and remove old versions of installed formulae.
func Cleanup() ArgumentsOption {
	return func() []string {
		return []string{"cleanup"}
	}
}

// Doctor checks your system for potential problems.
func Doctor() ArgumentsOption {
	return func() []string {
		return []string{"doctor"}
	}
}

// Install installs one or more formula or cask.
func Install(packages []string, isCasks bool) ArgumentsOption {
	return func() []string {
		args := []string{"install"}
		if isCasks {
			args = append(args, "--casks")
		}

		return append(args, packages...)
	}
}

// Leaves lists installed formulae that are not dependencies of another
// installed formula.
func Leaves() ArgumentsOption {
	return func() []string {
		return []string{"leaves", "--installed-on-request"}
	}
}

// Tap taps a formula repository.
func Tap(name string) ArgumentsOption {
	return func() []string {
		return []string{"tap", name}
	}
}

// Uninstall uninstalls one or more formula or cask.
func Uninstall(packages []string) ArgumentsOption {
	return func() []string {
		return append([]string{"uninstall"}, packages...)
	}
}

// Update fetches the newest version of Homebrew and all formulae from GitHub
// using git and perform any necessary migrations.
func Update() ArgumentsOption {
	return func() []string {
		return []string{"update", "--force"}
	}
}

// Upgrade upgrades outdated casks and outdated, unpinned formulae.
func Upgrade() ArgumentsOption {
	return func() []string {
		return []string{"upgrade"}
	}
}
