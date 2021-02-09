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
end
