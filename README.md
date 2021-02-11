<img style="display:block;text-align:center; width: 50px" src="https://github.com/jeaanca/shadow_moon/blob/master/assets/images/shadow_moon_logo.png"><br>

<p> Shadow Moon is a package with methods to preview process running in linux system. </p>
<p> All struct of the project is based in linux system, the metrics of process was constucted using native resources from machine </p>

<p> This is a system for analise of process and log files </p>

## Usage

To List all process:
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

To list details of process usind the PID and passing as an argument the columns required
```elixir
  ShadowMoon.detail_process(9999, [:Name, :VmData])

# {
#   Name: "gsd-housekeepin",
#   VmData: "34052 kB"
}
```

To list details of process usind the PID:
```elixir
  ShadowMoon.detail_process(9999)

# {
#   VmStk: "132 kB",
#   FDSize: "64",
#   Cpus_allowed: "f",
#   VmSize: "308684 kB",
...
#   VmExe: "16 kB",
...
#   VmSwap: "0 kB",
...
#   Name: "gsd-housekeepin",
...
#   VmData: "34052 kB",
#   Uid: "1000100010001000",
  ...
}
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


