defmodule SecureApp.HelloPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, "<h1>Hello world</h1>")
  end
end
