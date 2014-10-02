-module(lib_chan).
-export([cast/2, start_server/0, start_server/1,
	connect/5, disconnect/1, rpc/2]).

-import(lists, [map/2, member/2, foreach/2]).
-import(lib_chan_mm, [send/2, close/1]).

start_server() ->
    case os:getenv("HOME") of
	false ->
	    exit({ebaEnv, "HOME"});
	Home ->
	    start_server(Home ++ "/.erlang_config/lib_chan.conf")
    end.

