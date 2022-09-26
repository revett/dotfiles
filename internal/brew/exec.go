package brew

import (
	"bufio"
	"fmt"
	"os/exec"
	"strings"

	"github.com/rs/zerolog/log"
)

// ArgumentsOption is a functional option for controlling what brew subcommand
// is run for the Exec function.
type ArgumentsOption func() []string

// Exec allows for any Homebrew CLI command to be run, whilst either printing or
// returning the output.
func Exec(args ArgumentsOption) ([]string, error) {
	log.Info().Msgf("running `brew %s`", strings.Join(args(), " "))

	cmd := exec.Command("brew", args()...) //nolint:gosec

	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return nil, fmt.Errorf("unable to return command stdout pipe: %w", err)
	}

	cmd.Stderr = cmd.Stdout
	scanner := bufio.NewScanner(stdout)

	var output []string
	done := make(chan struct{})

	go func() {
		for scanner.Scan() {
			line := scanner.Text()
			fmt.Printf(" %s\n", line) //nolint:forbidigo
			output = append(output, line)
		}

		done <- struct{}{}
	}()

	if err = cmd.Start(); err != nil {
		return nil, fmt.Errorf("failed to start command: %w", err)
	}

	<-done

	if err = cmd.Wait(); err != nil {
		return nil, fmt.Errorf(
			"error when running `brew %s` command: %w",
			strings.Join(args(), " "),
			err,
		)
	}

	return output, nil
}
