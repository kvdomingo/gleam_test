import app/web
import gleam/http
import gleam/string_builder
import wisp

pub fn handle_request(req: wisp.Request) -> wisp.Response {
  use _req <- web.middleware(req)

  case wisp.path_segments(req) {
    [] -> index(req)
    _ -> wisp.not_found()
  }
}

fn index(req: wisp.Request) -> wisp.Response {
  use <- wisp.require_method(req, http.Get)
  let html = string_builder.from_string("<h1>Hello, World!</h1>")
  wisp.ok()
  |> wisp.html_body(html)
}
