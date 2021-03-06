package main

import (
	"log"
	"net/http"
	"go.uber.org/zap"
)

type server struct {}

 func main() {
	s := &server{}
	http.Handle("/", s)
	log.Fatal(http.ListenAndServe(":8093", nil))
}
func (s *server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`{"message": "Hello, world, from Docker!"}`))
}

func getLogger(logProd bool) (*zap.Logger, error) {
	if logProd {
		return zap.NewProduction()
	}
	return zap.NewDevelopment()
}