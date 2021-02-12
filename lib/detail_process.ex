defmodule DetailProcess do
  def get_key_value(content) do
    String.split(content, ":")
  end

  def status_to_struct([], struct) do
    struct
  end

  def status_to_struct([head | tail], struct) do
    [key | value] = get_key_value(head)

    if key != "" do
      struct_status = Map.put(struct, String.to_atom(key), String.trim(Enum.at(value, 0)))
      status_to_struct(tail, struct_status)
    else
      status_to_struct([], struct)
    end
  end

  def get_cols_status(data, list, current_struct \\ %{})

  def get_cols_status(_data, [], current_struct) do
    current_struct
  end

  def get_cols_status(data, [head | tail], current_struct) do
    value = Map.get(data, head)

    if value != nil do
      new_struct = Map.put(current_struct, head, value)
      get_cols_status(data, tail, new_struct)
    else
      get_cols_status(data, tail, current_struct)
    end
  end

  def status(pid, cols) do
    status_all(pid)
    |> get_cols_status(cols)
  end

  def get_parent_process(pid) do
    file = "/proc/#{pid}/task/#{pid}/status"

    if File.exists?(file) do
      {_status, content} = File.read(file)

      [pos | _] = Regex.run(~r/PPid/, content, return: :index)
      {pos, _} = pos
      pid = String.slice(content, pos, 15)
      [_, pid] = String.split(pid, "\t")
      [pid, _] = String.split(pid, "\n")
      pid
    else
      {:none, pid}
    end
  end

  def pid_child_process(pid) do
    file = "/proc/#{pid}/task/#{pid}/children"

    if File.exists?(file) do
      {_status, content} = File.read(file)

      content
      |> String.trim()
      |> String.split(" ")
    else
      {:none, pid}
    end
  end

  def status_all(pid) do
    file = "/proc/#{pid}/status"

    if File.exists?(file) do
      {_status, content} = File.read(file)

      String.replace(content, "\t", "")
      |> String.split("\n")
      |> status_to_struct(%{})
    else
      {:none, pid}
    end
  end
end
