-module(mytest).
-include_lib("eunit/include/eunit.hrl").

my_test_() ->
    [?_assert(true =:= true),
     ?_assert(true =:= true)].
