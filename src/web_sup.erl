%%%-------------------------------------------------------------------
%%% @author Jeff Wong <jwong@Jeffs-MBP>
%%% @copyright (C) 2016, Jeff Wong
%%% @doc
%%%
%%% @end
%%% Created :  5 Nov 2016 by Jeff Wong <jwong@Jeffs-MBP>
%%%-------------------------------------------------------------------
-module(web_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart intensity, and child
%% specifications.
%%
%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
    SupFlags = #{strategy => one_for_one,
                 intensity => 1000,
                 period => 1},

    WebWorker = #{id => 'web_worker',
               start => {'web_worker', start_link, []},
               restart => permanent,
               shutdown => 5000,
               type => worker,
               modules => ['web_worker']},

    {ok, {SupFlags, [WebWorker]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
