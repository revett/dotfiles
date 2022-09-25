package config

import (
	"fmt"
	"os"
	"path"

	"github.com/revett/dotfiles/internal/slice"
	"github.com/rs/zerolog/log"
	"gopkg.in/yaml.v3"
)

// Config holds the list of Homebrew packages (formulae and casks) to install
// locally.
type Config struct {
	Formulae []string `yaml:"formulae"`
	Casks    []string `yaml:"casks"`
}

// Load reads the configuration file, located at ~/.hops.yml, in to a Config
// struct. It also checks that the file is not empty, and deduplicates the
// two slices of packages.
func Load() (Config, error) {
	homeDir, err := os.UserHomeDir()
	if err != nil {
		return Config{}, fmt.Errorf("unable to return user home directory: %w", err)
	}

	filepath := path.Join(homeDir, ".hops.yml")
	log.Info().Msgf("loading config: %s", filepath)

	file, err := os.ReadFile(filepath) //nolint:gosec
	if err != nil {
		return Config{}, fmt.Errorf("unable to read file at %s: %w", filepath, err)
	}

	config := Config{}

	if err := yaml.Unmarshal(file, &config); err != nil {
		return Config{}, fmt.Errorf("failed to unmarshal data: %w", err)
	}

	if len(config.Formulae) == 0 {
		return Config{}, fmt.Errorf("length of formulae list in config is zero")
	}

	if len(config.Casks) == 0 {
		return Config{}, fmt.Errorf("length of casks list in config is zero")
	}

	config.Formulae = slice.Dedup(config.Formulae)
	config.Casks = slice.Dedup(config.Casks)

	return config, nil
}

func (c Config) Log() {
	log.Info().Msgf("%d formulae found in config", len(c.Formulae))
	for _, f := range c.Formulae {
		fmt.Printf(" %s\n", f) //nolint:forbidigo
	}

	log.Info().Msgf("%d casks found in config", len(c.Casks))
	for _, c := range c.Casks {
		fmt.Printf(" %s\n", c) //nolint:forbidigo
	}
}
