-module(burbweb_admin_session).
-export([
         init/0,
         index/3
        ]).

init() ->
    html.

index(<<"GET">>, _Path, _Req) ->
    ETSInfo = ets:info(burbweb_session), %% This is a bit ugly since we're querying the name directly
    {ok, [{ets_info, ETSInfo}]}.
