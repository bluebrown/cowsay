-module(cowsay_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", handle_hello, []}]}
    ]),
    {ok, _} = cowboy:start_clear(
        cowsay_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    cowsay_sup:start_link().

stop(_State) ->
    ok.
