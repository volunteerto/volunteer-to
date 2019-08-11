package api

import (
	"net/http"

	"github.com/go-chi/chi"
)

func health(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
}

// New returns an 'http.Handler' that serves the ship-it API.
func New() http.Handler {

	r := chi.NewRouter()

	r.Get("/health", health)

	r.Route("/api", func(r chi.Router) {
		// List Endpoints here
	})

	return r
}
