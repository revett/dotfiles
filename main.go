package main

import (
	"os"

	"github.com/revett/dotfiles/internal/brew"
	"github.com/revett/dotfiles/internal/config"
	"github.com/revett/dotfiles/internal/prompt"
	"github.com/revett/dotfiles/internal/slice"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func main() { //nolint:cyclop,funlen
	log.Logger = log.Output(
		zerolog.ConsoleWriter{
			Out: os.Stdout,
		},
	)

	cfg, err := config.Load()
	if err != nil {
		log.Fatal().Err(err).Send()
	}
	cfg.Log()

	if err := prompt.Confirm(); err != nil {
		log.Fatal().Err(err).Send()
	}

	for _, tap := range cfg.Taps {
		if _, err := brew.Exec(brew.Tap(tap)); err != nil {
			log.Fatal().Err(err).Send()
		}
	}

	installedFormulae, err := brew.Exec(brew.Leaves())
	if err != nil {
		log.Fatal().Err(err).Send()
	}

	installedCasks, err := brew.Exec(brew.Casks())
	if err != nil {
		log.Fatal().Err(err).Send()
	}

	formulaeToUninstall := slice.Diff(installedFormulae, cfg.Formulae)
	log.Info().Strs("formulae", formulaeToUninstall).
		Msgf("%d formulae to uninstall", len(formulaeToUninstall))

	casksToUninstall := slice.Diff(installedCasks, cfg.Casks)
	log.Info().Strs("casks", casksToUninstall).
		Msgf("%d casks to uninstall", len(casksToUninstall))

	if err := prompt.Confirm(); err != nil {
		log.Fatal().Err(err).Send()
	}

	if len(formulaeToUninstall) > 0 {
		if _, err := brew.Exec(brew.Uninstall(formulaeToUninstall)); err != nil {
			log.Fatal().Err(err).Send()
		}
	}

	if len(casksToUninstall) > 0 {
		if _, err := brew.Exec(brew.Uninstall(casksToUninstall)); err != nil {
			log.Fatal().Err(err).Send()
		}
	}

	formulaeToInstall := slice.Diff(cfg.Formulae, installedFormulae)
	log.Info().Strs("formulae", formulaeToInstall).
		Msgf("%d formulae to install", len(formulaeToInstall))

	casksToInstall := slice.Diff(cfg.Casks, installedCasks)
	log.Info().Strs("casks", casksToInstall).
		Msgf("%d casks to install", len(casksToInstall))

	if err := prompt.Confirm(); err != nil {
		log.Fatal().Err(err).Send()
	}

	if len(formulaeToInstall) > 0 {
		if _, err := brew.Exec(brew.Install(formulaeToInstall, false)); err != nil {
			log.Fatal().Err(err).Send()
		}
	}

	if len(casksToInstall) > 0 {
		if _, err := brew.Exec(brew.Install(casksToInstall, true)); err != nil {
			log.Fatal().Err(err).Send()
		}
	}

	if _, err := brew.Exec(brew.Update()); err != nil {
		log.Fatal().Err(err).Send()
	}

	if _, err := brew.Exec(brew.Upgrade()); err != nil {
		log.Fatal().Err(err).Send()
	}

	if _, err := brew.Exec(brew.AutoRemove()); err != nil {
		log.Fatal().Err(err).Send()
	}

	if _, err := brew.Exec(brew.Cleanup()); err != nil {
		log.Fatal().Err(err).Send()
	}

	if _, err := brew.Exec(brew.Doctor()); err != nil {
		log.Fatal().Err(err).Send()
	}
}
