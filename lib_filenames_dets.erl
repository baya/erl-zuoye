-module(lib_filenames_dets).
-export([open/1, close/0, test/0, filename2index/1, index2filename/1]).

open(File) ->
    io:format("dets opened:~p~n", [File]),
    Bool = filelib:is_file(File),
    case dets:open_file(?MODULE, [{file, File}]) of
	{ok, ?MODULE} ->
	    case Bool of
		true -> void;
		false -> ok = dets:insert(?MODULE, {free, 1})
	    end,
	    true;
	{error, Reason} ->
	    io:format("cannot open dets table~n"),
	    exit({eDetsOpen, File, Reason})
end.

close() -> dets:close(?MODULE).


