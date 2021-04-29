# Identicon

It's my first Elixir Project. For Elixir 1.11.2 (compiled with Erlang/OTP 23)

## Installation

To install the Elixir SDK follow the instruction on: https://elixir-lang.org/install.html

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ide` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ide, "~> 0.1.0"}
    {:egd, github: "erlang/egd"}
  ]
end
```

## Launch

To execute the project the first time, at the terminal in the path projects, write: mix deps.get

To execute the project, launch at the console: iex -S mix

To execute the application: Identicon.main("asdf")


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ide](https://hexdocs.pm/ide).

