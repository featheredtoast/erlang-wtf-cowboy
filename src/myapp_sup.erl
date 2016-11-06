%%%-------------------------------------------------------------------
%% @doc myapp top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(myapp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    WebSup = #{id => 'web_sup',
               start => {'web_sup', start_link, []},
               restart => permanent,
               shutdown => 5000,
               type => supervisor,
               modules => ['web_sup']},

    {ok, { {one_for_all, 0, 1}, [WebSup]} }.

%%====================================================================
%% Internal functions
%%====================================================================
