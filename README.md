# Grove

## Targets

`MIX_TARGET=bbb`

## Getting Started

### Setting up wifi:

  * `cp config/wifi.exs.example config/wifi.exs`
  * update `config/wifi.exs` with your wifi settings

### Build and deploy

  * `export NERVES_TARGET=bbb` or prefix every command with `NERVES_TARGET=bbb`
  * `mix deploy` will get deps, build firmware and burn it to an SD card

## Check out that everything is working

  * To see the system is up and running run `Nerves.NetworkInterface.status("wlan0")`
    * Look for `is_running: true, is_up: true` to tell if the interface
      is up and if it is connected
  * Check for the ip with `inet.getif()`

~~~elixir
iex(7)> :inet.getif()
  {:ok,
  [{{10, 0, 1, 10}, {10, 0, 1, 255}, {255, 255, 255, 0}},
   {{127, 0, 0, 1}, {0, 0, 0, 0}, {255, 0, 0, 0}}]}
~~~

In my case the ip is `10.0.1.10`. The `127.0.0.1` is the `lo` interface.

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: http://www.nerves-project.org/
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
