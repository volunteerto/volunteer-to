package config

import (
	"github.com/kelseyhightower/envconfig"
)

// Config holds the environment variables required to initialize the API
type Config struct {
	ServicePort string `split_words:"true" default:"80"`
	DBUser      string `envconfig:"DB_USER"`
	DBPassword  string `envconfig:"DB_PASSWORD"`
}

// FromEnv Loads the environment variables and returns them in a Config struct
func FromEnv() (*Config, error) {
	env := new(Config)
	if err := envconfig.Process("", env); err != nil {
		return nil, err
	}
	return env, nil
}
