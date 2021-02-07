defmodule ShadowMoonTest do
  use ExUnit.Case
  doctest ShadowMoon

  test "greets the world" do
    assert ShadowMoon.hello() == :world
  end
end
