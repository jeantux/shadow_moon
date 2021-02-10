# ShadowMoon

<p> Shadow Moon is a package with methods to preview process running in linux system. </p>
<p> All struct of the project is based in linux system, the metrics of process was constucted using native resources from machine </p>

<p> This is a system for analise of process and log files </p>

## Usage


```elixir
  ShadowMoon.show_proccess

# [
#   %{
#     "%CPU": "0.0",
#     "%MEM": "0.1",
#     COMMAND: "systemd",
#     NI: "0",
#     PID: "854",
#     PRI: "19",
#     TIME: "00:00:00",
#     USER: "shadow"
#   },
#   ...
# ]

```
## Installation

The package can be installed
by adding `shadow_moon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:shadow_moon, git: "https://github.com/jeaanca/shadow_moon.git", tag: "0.1.0"}
  ]
end
```


