-module(burbweb_admin_dashboard).
-export([
         init/0,
         index/3
        ]).

init() ->
    html.

index(<<"GET">>, _Path, _Req) ->
    Memory = erlang:memory(),
    {ok, [{memory, Memory}]}.
