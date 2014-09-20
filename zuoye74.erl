-module(zuoye74).
-export([reverse_binary/1,get_reverse_end_order/0, reverse_bits/1]).
-export([test/0]).

reverse_binary(Bin) ->
    Size = byte_size(Bin) * 8,
    <<Value:Size>> = Bin,
    case get_reverse_end_order() of
	little -> <<Value:Size/little>>;
	big -> <<Value:Size/big>>
    end.

get_reverse_end_order() ->
    <<Value:16>> = <<16#123:16>>,
    case <<Value:16>> of
	<<Value:16/big>> -> little;
	<<Value:16/little>> -> big
    end.


reverse_bits(Bin) ->
    Bits = [X || <<X:1>> <= Bin],
    << <<X>> || X <- my_reverse_list(Bits)>>.

my_reverse_list([]) -> [];
my_reverse_list([H|T]) ->
    my_reverse_list(T) ++ [H].



test() ->
    [1,2,3] = my_reverse_list([3,2,1]),
    <<1,1,1,1,0,0,0,0>> = reverse_bits(<<16#f>>).


