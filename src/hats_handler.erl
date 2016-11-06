-module(hats_handler).
-export([init/3, handle/2, terminate/3]).

init(_Type, Req, _Opts) ->
    {ok, Req, undefined}.

handle(Req, Opts) ->
    {Arg, _} = cowboy_req:binding(name, Req),
    Body = "Hello there! " ++ Arg,
    {ok, Resp} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}],
                           list_to_binary(Body), Req),
    {ok, Resp, Opts}.

terminate(_,_,_) ->
    ok.
