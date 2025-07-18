%%% ----------------------------------------------------------------------------
%%% @private
%%% @copyright 2006 Erlang Training and Consulting
%%% @doc
%%% The Eastrisk application.
%%% @end
%%% ----------------------------------------------------------------------------
-module(eastrisk).
-behaviour(application).

-export([start/2, stop/1]).

%% -----------------------------------------------------------------------------
%% @hidden
%% -----------------------------------------------------------------------------
start(_Type, _Args) ->
    {ok,Pid}=eastrisk_sup:start_link(),
    {ok,Pid2} = elli_minimal_sup:start_link(),
    inets:start(),
    ast_manager_zap:init(),
    {ok,Pid}.
  

start()->
     application:start(eastrisk).

%% -----------------------------------------------------------------------------
%% @hidden
%% -----------------------------------------------------------------------------
stop(_State) ->
	ok.
