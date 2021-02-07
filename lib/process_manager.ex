defmodule ProcessManager do
    def whoami() do
        {user, _} = System.cmd(Atom.to_string(:whoami), [])
        user
        |> String.replace("\n", "")
        |> String.trim
    end

    def remove_space(content, by_char) do
        content
        |> String.replace("        ", by_char)   
        |> String.replace("       ", by_char)   
        |> String.replace("      ", by_char)        
        |> String.replace("     ", by_char)        
        |> String.replace("    ", by_char)        
        |> String.replace("   ", by_char)
        |> String.replace("  ", by_char)
    end

    def break_lines(head) do
        head
        |> String.trim
        |> remove_space("|")
        |> String.split("|")
    end

    def process_in_list([head | tail], content \\ []) do
        n_head = break_lines head
        n_content = content ++ [n_head]
        case tail do
            [] -> n_content
            _l -> process_in_list(tail, n_content)
        end
    end

    def ps_all do
        user = whoami()
        params = ["-ao", "pid,user,pri,nice,pcpu,pmem,time,comm", "-U", user]
        process = System.cmd("ps", params)
        [head, _tail] = Tuple.to_list process
        
        String.split(head, "\n")
        |> process_in_list
    end


end