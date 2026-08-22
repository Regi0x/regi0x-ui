package main

import (
	"context"
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/Regi0x/regi0x-ui/web/pages"
)

type registry struct {
	SchemaVersion int                    `json:"schemaVersion"`
	Components    map[string]interface{} `json:"components"`
	Patterns      map[string]interface{} `json:"patterns"`
	Screens       map[string]interface{} `json:"screens"`
}

func checkRegistry() error {
	data, err := os.ReadFile("registry/registry.json")
	if err != nil {
		return err
	}
	var r registry
	if err := json.Unmarshal(data, &r); err != nil {
		return err
	}
	if r.SchemaVersion < 1 {
		return fmt.Errorf("invalid schemaVersion")
	}
	if len(r.Components) == 0 {
		return fmt.Errorf("registry has no components")
	}
	return nil
}

func main() {
	check := flag.Bool("check-registry", false, "validate registry and exit")
	flag.Parse()
	if *check {
		if err := checkRegistry(); err != nil {
			log.Fatal(err)
		}
		fmt.Println("registry ok")
		return
	}

	if err := checkRegistry(); err != nil {
		log.Fatalf("registry: %v", err)
	}

	mux := http.NewServeMux()
	mux.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
	mux.HandleFunc("/healthz", func(w http.ResponseWriter, _ *http.Request) { w.WriteHeader(http.StatusNoContent) })
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/" {
			http.NotFound(w, r)
			return
		}
		if err := pages.Home().Render(context.Background(), w); err != nil {
			http.Error(w, "render failed", http.StatusInternalServerError)
		}
	})

	addr := os.Getenv("HTTP_ADDR")
	if addr == "" {
		addr = "127.0.0.1:8090"
	}
	server := &http.Server{Addr: addr, Handler: mux, ReadHeaderTimeout: 5 * time.Second}
	log.Printf("Regi0x UI Lab listening on %s", addr)
	log.Fatal(server.ListenAndServe())
}
