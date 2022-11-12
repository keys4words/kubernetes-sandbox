package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Println("Starting mysimple App...")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8000", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	log.Printf("Request received from %s", r.RemoteAddr)
	fmt.Fprintf(w, "Say, hey!")
}
