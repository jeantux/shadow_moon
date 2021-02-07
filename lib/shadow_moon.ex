defmodule ShadowMoon do
  @moduledoc """
  Documentation for `ShadowMoon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ShadowMoon.hello()
      :world

  """
  import ProcessManager

  def show_proccess do
    ps_all()
  end
end
