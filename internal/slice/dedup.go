package slice

// Dedup removes duplicates from the slice.
// TODO: write some tests.
func Dedup(s []string) []string {
	known := make(map[string]bool)
	unique := []string{}

	for _, e := range s {
		if _, value := known[e]; !value {
			known[e] = true
			unique = append(unique, e)
		}
	}

	return unique
}
