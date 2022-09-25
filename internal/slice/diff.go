package slice

// Diff returns the elements in slice a that are not in slice b. Note both
// slices must be deduplicated.
// TODO: write some tests.
func Diff(a []string, b []string) []string { //nolint:varnamelen
	mapB := make(map[string]struct{}, len(b))

	for _, e := range b {
		mapB[e] = struct{}{}
	}

	var diff []string

	for _, e := range a {
		if _, ok := mapB[e]; !ok {
			diff = append(diff, e)
		}
	}

	return diff
}
