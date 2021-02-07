defmodule ShadowMoon do
  @moduledoc """
  Documentation for `ShadowMoon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ShadowMoon.show_proccess()
      ...

  """
  import ProcessManager

  def show_proccess do
    ps_all()
  end
end
