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

  def status(pid) do
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
