## cmd/main.go
package main

import (
  "fmt"
  "log"
  "net/http"
  "os"

  "github.com/gihyodocker/todoapi"
)

func main() {
  
  env, err := todoapi.CreateEnv()
  if err != nil {
    fmt.Fprint(os.Stderr, err.Error())
    os.Exit(1)
  }

  masterDB, err := todoapi.CreateDbMap(env.MasterURL)
  if err != nil {
    fmt.Fprintf(os.Stderr, "%s is invalid database", env.MasterURL)
    return
  }

  slaveDB, err := todoapi.CreateDbMap(env.SlaveURL)
  if err != nil {
    fmt.Fprintf(os.Stderr, "%s is invalid database", env.SlaveURL)
    return
  }

  mux := http.NewServeMux()

  hc := func(w http.ResponseWriter, r *http.Request) {
    log.Println("[GET] /hc")
    w.Write([]byte("OK"))
  }

  todoHandler := todoapi.NewTodoHandler(masterDB, slaveDB)

  mux.Hnadle("/todo", todoHandler)
  mux.HandleFunc("/hc", hc)

  s := http.Server{
    Addr: env.Bind,
    Handler: mux,
  }
  log.Printf("Listen HTTP Server")
  if err := s.ListenAndServe(); err != nil {
    log.Fatal(err)
  }
}

//
package todoapi

import (
  "errors"
  "os"
)

type Env struct {
  Bind string
  Master string
  SlaveURL string
}

func CreateEnv() (*Env, error) {
  
  env: = Env{}

  bind := os.Getenv("TODO_BIND")
  if bind == "" {
    env.Bind = ":8080"
  }
  env.Bind = bind

  masterURL := os.Getenv("TODO_MASTER_URL")
  if masterURL == "" {
    return nil, errors.New("TODO_MASTER_URL is not specified")
  }
  env.MasterURL = masterURL

  slaveURL := os.Getenv("TODO_SLAVE_URL")
  if slaveURL == "" {
    return nil, errors.New("TODO_SLAVE_URL is not specified")
  }
  env.SlaveURL = slaveURL

  return &env, nil
}

//
func CreateDbMap(dbURL string) (*gorp.DbMap, error) {

}

type Todo struct {
  ID uint `db:"id" json:"id"`
  Title string `db:"content" json:"title"`
  Content string `db:"content" json:"content"`
  Status string `db:"status" json:"status"`
  Created time.Time `db:"created" json:"created"`
  Updated time.Time `db:"updated" json:"updated"`
}



