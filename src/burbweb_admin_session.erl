-module(burbweb_admin_session).
-export([
         index/1
        ]).

index(_Req) ->
    ETSInfo = ets:info(burbweb_session), %% This is a bit ugly since we're querying the name directly
    {ok, [{ets_info, ETSInfo}]}.
