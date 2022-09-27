package prompt

import (
	"fmt"
	"os"

	"github.com/manifoldco/promptui"
	"github.com/rs/zerolog/log"
)

// Confirm requests the user to confirm an action taken by the CLI before it
// occurs.
func Confirm() error {
	prompt := promptui.Prompt{
		Label:       "Correct",
		HideEntered: true,
		IsConfirm:   true,
	}

	_, err := prompt.Run()
	if err != nil {
		// manifoldco/promptui returns an empty error when the user selects "no"
		// option
		if err.Error() == "" {
			log.Warn().Msg("exiting early")
			os.Exit(1)
		}

		return fmt.Errorf("tui prompt failed: %w", err)
	}

	return nil
}
