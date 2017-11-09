defmodule SecureApp do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        :http, SecureApp.HelloPlug, [], port: 8080
      )
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
