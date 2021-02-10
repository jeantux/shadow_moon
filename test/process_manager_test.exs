defmodule ProcessManagerTest do
  use ExUnit.Case
  doctest ProcessManager

  test "white space removal test" do
    assert ProcessManager.remove_space("one two   tree     for", "-") == "one-two-tree-for"
  end

  test "test of separating string into list" do
    assert ProcessManager.break_lines("title1 title2   title3    title4") == [
             "title1",
             "title2",
             "title3",
             "title4"
           ]
  end

  test "conversion of list to struct" do
    process = [
      ["PID", "Name", "User"],
      ["001", "Shadow", "shadow_moon"],
      ["002", "systemd", "shadow_moon"]
    ]

    assert ProcessManager.convert_to_struct(process) == [
             %{Name: "Shadow", PID: "001", User: "shadow_moon"},
             %{Name: "systemd", PID: "002", User: "shadow_moon"}
           ]
  end

  test "atom to string in args format" do
    assert ProcessManager.ao_to_string([:pid, :user, :pri, :nice, :pcpu, :pmem, :time, :comm]) ==
             "pid,user,pri,nice,pcpu,pmem,time,comm"
  end
end
