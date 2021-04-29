defmodule IdenticonTest do
  use ExUnit.Case
  doctest identicon

  test "greets the world" do
    assert Identicon.hello() == :world
  end
end
