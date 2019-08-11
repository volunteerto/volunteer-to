package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("running")
	http.HandleFunc("/", helloServer)
	http.ListenAndServe(":8000", nil)
}

func helloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}
