-module(zy_12_9).
-export([start/2]).

start(AnAtom, Fun) ->
  register(AnAtom, spawn(Fun)).
