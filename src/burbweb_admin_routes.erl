%%% @author Niclas Axelsson <niclas@burbas.se>
%%% @copyright (C) 2018, Niclas Axelsson
%%% @doc
%%%
%%% @end
%%% Created : 27 Jun 2018 by Niclas Axelsson <niclas@burbas.se>

-module(burbweb_admin_routes).
-export([
         init/0,
         list/3
        ]).

init() -> html.


list(<<"GET">>, _Path, _Req) ->
    %% Get the routes in the system
    {ok, Routes} = burbweb_router:get_routes(),
    {ok, [{routes, format_host(Routes)}]}.





%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Private functions       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
format_host([]) -> [];
format_host([{Host, Routes}|Tl]) ->
    case Host of
        '_' ->
            [{"*", format_routes(Routes)}|format_host(Tl)];
        _ ->
            [{Host, format_routes(Routes)}|format_host(Tl)]
    end.

format_routes([]) -> [];
format_routes([{Route, _InternalController, Map}|Tl]) when is_map(Map) ->
    [Map#{route => Route}|format_routes(Tl)];
format_routes([{Route, cowboy_static, _Tuple}|Tl]) ->
    [#{route => Route, mod => "burbweb", func => "static", app => "static"}|format_routes(Tl)].
