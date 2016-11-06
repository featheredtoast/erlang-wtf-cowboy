-module(web_handler).
-export([init/3, handle/2, terminate/3]).

init(_Type, Req, _Opts) ->
    {ok, Req, undefined}.

handle(Req, Opts) ->
    {ok, Resp} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}],
                           <<"Hello, World!">>, Req),
    {ok, Resp, Opts}.

terminate(_,_,_) ->
    ok.
