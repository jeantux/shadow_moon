# ShadowMoon

Shadow Moon is a package with methods to preview process running in linux system.

```elixir
  ShadowMoon.show_proccess

[
  %{
    "%CPU": "0.0",
    "%MEM": "0.1",
    COMMAND: "systemd",
    NI: "0",
    PID: "854",
    PRI: "19",
    TIME: "00:00:00",
    USER: "shadow"
  },
  ...
]


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `shadow_moon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:shadow_moon, "~> 0.1.0"}
  ]
end
```


