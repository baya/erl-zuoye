-module(my_file).
-export([read/1]).

read(File) ->
    case file:read_file(File) of
	{ok, Bin} ->
	    Bin;
	{error, Why} ->
	    error(Why)
    end.
