%%
%% %CopyrightBegin%
%%
%% Copyright Hillside Technology Ltd. 2016. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%
%% %CopyrightEnd%
%%

%%% functions that are used by the generated server/handler module.
%%%
-module(soap_server_util).

-export([start/3, start/4]).
-export([stop/3]).

-spec start(Module::module(), Server::module(), Options::[any()]) -> any().
start(Module, Server, Options) ->
    Server2 = proplists:get_value(http_server, Options, Server),
    Options2 = proplists:delete(http_server, Options),
    Server2:start(Module, Options2).

-spec start(Module::module(), Server::module(), Options::[any()], cowboy_protocol:opts()) -> any().
start(Module, Server, Options, ExtraOpts) ->
    Server2 = proplists:get_value(http_server, Options, Server),
    Options2 = proplists:delete(http_server, Options),
    Server2:start(Module, Options2, ExtraOpts).


-spec stop(Module::module(), Server::module(), Options::[any()]) -> any().
stop(_Module, Server, Options) ->
    Server2 = proplists:get_value(http_server, Options, Server),
    Server2:stop().
