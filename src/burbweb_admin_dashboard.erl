-module(burbweb_admin_dashboard).
-export([
         index/1
        ]).

index(_Req) ->
    Memory = erlang:memory(),
    {ok, [{memory, Memory}]}.
