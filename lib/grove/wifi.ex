defmodule Grove.WiFi do
  use Supervisor

  @interface :wlan0
  @kernel_modules Mix.Project.config[:kernel_modules] || []

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Task, [fn -> init_kernel_modules() end], restart: :transient, id: Nerves.Init.KernelModules),
      worker(Task, [fn -> init_network() end], restart: :transient, id: Nerves.Init.Network),
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    supervise(children, opts)
  end

  def init_kernel_modules do
    Enum.each(@kernel_modules, & System.cmd("modprobe", [&1]))
  end

  def init_network do
    opts = Application.get_env(:grove, @interface)
    Nerves.InterimWiFi.setup(@interface, opts)
  end
end
