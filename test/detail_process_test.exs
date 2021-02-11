defmodule DetailProcessTest do
  use ExUnit.Case
  doctest DetailProcess

  test "get one value from struct" do
    struct_test = %{Name: "Shadow", PID: "001", User: "shadow_moon"}
    cols = [:Name]
    assert DetailProcess.get_cols_status(struct_test, cols) == %{Name: "Shadow"}
  end

  test "get multiples values from struct" do
    struct_test = %{Name: "Shadow", PID: "001", User: "shadow_moon", VmData: "1 kB"}
    cols = [:Name, :VmData]
    assert DetailProcess.get_cols_status(struct_test, cols) == %{Name: "Shadow", VmData: "1 kB"}
  end

  test "key not found in struct" do
    struct_test = %{Name: "Shadow", PID: "001", User: "shadow_moon", VmData: "1 kB"}
    cols = [:Shadow, :Moon]
    assert DetailProcess.get_cols_status(struct_test, cols) == %{}
  end
end
