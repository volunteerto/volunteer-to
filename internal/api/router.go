package api

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi"
)

func health(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}

// New returns an 'http.Handler' that serves the ship-it API.
func New() http.Handler {

	r := chi.NewRouter()

	r.Get("/health", health)

	r.Route("/api", func(r chi.Router) {
		// List Endpoints here
		r.Get("/hello-world", helloWorld)
	})

	return r
}
