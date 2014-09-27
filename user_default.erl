-module(user_default).
-compile([export_all]).

hello() ->
    "Hello Joe How are you?".

away(Time) ->
    io:format("Joe is away and will be back in ~w minutes ~n", [Time]).
