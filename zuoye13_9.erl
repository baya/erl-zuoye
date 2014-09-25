-module(zuoye13_9).
-export([my_spawn/3,fl2a/0]).

my_spawn(Mod, Func, Args) ->
    statistics(runtime),
    statistics(wall_clock),

    {Pid, Ref} = spawn_monitor(Mod, Func, Args),
    receive
	{'DOWN', Ref, process, Pid, Why} ->
	    {_, Time1} = statistics(runtime),
	    {_, Time2} = statistics(wall_clock),
	    U1 = Time1 * 1000,
	    U2 = Time2 * 1000,
	    io:format("~p died with: ~p and time measure: ~p(~p)~n", [Pid, Why, U1, U2])
    end,
    Pid.

fl2a() ->
    receive
	X -> list_to_atom(X)
    end.
