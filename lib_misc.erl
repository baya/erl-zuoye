-module(lib_misc).
-export([for/3,qsort/1,pythag/1,perms/1,on_exit/2]).
-export([unconsult/2]).


for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I+1, Max, F)].

qsort([]) -> [];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
	++ [Pivot] ++
	qsort([X || X <- T, X >= Pivot]).


pythag(N) ->
    [{A, B, C} ||
	A <- lists:seq(1,N),
	B <- lists:seq(1,N),
	C <- lists:seq(1,N),
	A+B+C =< N,
	A*A + B*B =:= C*C
	].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

on_exit(Pid, Fun) ->
    spawn(fun() ->
		  Ref = monitor(process, Pid),
		  receive
		      {'Down', Ref, process, Pid, Why} ->
			  Fun(Why)
		  end
	  end).


keep_alive(Name, Fun) ->
    register(Name, Pid = spawn(Fun)),
    on_exit(Pid, fun(_Why) -> keep_alive(Name, Fun) end).


unconsult(File, L) ->
    {ok, S} = file:open(File, write),
    lists:foreach(fun(X) -> io:format(S, "~p.~n", [X]) end, L),
    file:close(S).


