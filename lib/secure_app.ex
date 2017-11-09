defmodule SecureApp do
  use Application

  def start(_type, _args) do

    cowboy_options = [
      keyfile: "priv/keys/localhost.key",
      certfile: "priv/keys/localhost.cert",
      otp_app: :secure_app,
      port: 4040
    ]

    children = [
      Plug.Adapters.Cowboy.child_spec(
        :https, SecureApp.HelloPlug, [], cowboy_options
      )
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
