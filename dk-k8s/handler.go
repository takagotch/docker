package todoapi

import ()

type TodoHandler struct {

}

func NewTodoHandler() http.Handler {

}

func (h TodoHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
  log.Printf()
  switch r.Method {
  case "GET":
    h.serveGET(w, r)
    return
  case "POST":
    h.servePOST(w, r)
    return
  case "PUT":
    h.servePUT(w, r)
    return
  default:
    NewErrorResponse(http.StatusMethodNotAllowed, fmt.Sprintf("%s is Unsupported method", r.Method)).Write(w)
    return
  }
}

