defmodule ShadowMoon do
  @moduledoc """
  Documentation for `ShadowMoon`.
  """

  @doc """
  Hello world.

  ## Examples


  """
  import ProcessManager
  import DetailProcess

  def show_proccess do
    ps_all()
  end

  def detail_process(pid, cols \\ []) do
    case cols do
      [] -> status_all(pid)
      _ -> status(pid, cols)
    end
  end
end
