-module(elli_minimal_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    SupName = {local, ?MODULE},
    Module = ?MODULE,
    Args = [],
    supervisor:start_link(SupName, Module, Args).

init([] = _Args) ->
    ElliOpts = [
        {callback, elli_example_callback},
        {port, 3000}
    ],
    ElliSpec = {
        _Id = elli_minimal_http,
        _Start = {elli, start_link, [ElliOpts]},
        _Restart = permanent,
        _Shutdown = 5000,
        _Worker = worker,
        _Modules = [elli]},

    {ok, {{_Strategy = one_for_one, _Intensity = 5, _Period = 10}, [ElliSpec]} }.
