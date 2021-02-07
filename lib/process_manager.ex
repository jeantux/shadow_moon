defmodule ProcessManager do
    def whoami() do
        {user, _} = System.cmd(Atom.to_string(:whoami), [])
        user
        |> String.replace("\n", "")
        |> String.trim
    end

    def ps_all do
        user = whoami()
        params = ["-ao", "pid,user,pri,nice,pcpu,pmem,time,comm", "-U", user]
        process = System.cmd("ps", params)
        [head, _tail] = Tuple.to_list process
        String.split(head, "\n")
    end
end