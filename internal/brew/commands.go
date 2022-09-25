package brew

func AutoRemove() ArgumentsOption {
	return func() []string {
		return []string{"autoremove"}
	}
}

func Casks() ArgumentsOption {
	return func() []string {
		return []string{"list", "--casks", "-1"}
	}
}

func Cleanup() ArgumentsOption {
	return func() []string {
		return []string{"cleanup"}
	}
}

func Doctor() ArgumentsOption {
	return func() []string {
		return []string{"doctor"}
	}
}

func Install(packages []string) ArgumentsOption {
	return func() []string {
		return append([]string{"install"}, packages...)
	}
}

func Leaves() ArgumentsOption {
	return func() []string {
		return []string{"leaves"}
	}
}

func Uninstall(packages []string) ArgumentsOption {
	return func() []string {
		return append([]string{"uninstall"}, packages...)
	}
}

func Update() ArgumentsOption {
	return func() []string {
		return []string{"update", "--force"}
	}
}

func Upgrade() ArgumentsOption {
	return func() []string {
		return []string{"upgrade"}
	}
}
