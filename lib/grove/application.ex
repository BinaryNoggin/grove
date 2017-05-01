defmodule Grove.Application do
  @moduledoc false
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      supervisor(Grove.WiFi, [])
    ]

    opts = [strategy: :one_for_one, name: Grove.Supervisor]
    Supervisor.start_link(children, opts)
  end
end