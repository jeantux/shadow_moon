defmodule ShadowMoon do
  import ProcessManager
  import DetailProcess

  def show_proccess, do: ps_all()

  def detail_process(pid), do: status_all(pid)

  def detail_process(pid, cols), do: status(pid, cols)
end
