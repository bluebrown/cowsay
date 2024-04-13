-module(handle_hello).

-export([init/2]).

init(Req, State) ->
    Res = cowboy_req:reply(
        200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Erlang!">>,
        Req
    ),
    {ok, Res, State}.
