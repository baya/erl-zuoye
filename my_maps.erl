-module(my_maps).
-export([map_search_pred/2]).

detect([], _)       -> {}.
detect([H|T], Pred) ->
    {K, V} = H,
    case Pred(K, V) of
	true -> H;
	false  -> detect(T, Pred)
    end;

%% my_maps:map_search_pred(#{name=>"jim", gend=>"male"}, fun(K, V) -> V=="jim" end).
map_search_pred(Map, Pred) ->
    L = maps:to_list(Map),
    detect(L, Pred).


