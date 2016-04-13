#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

if [[ -a .git/shallow ]]; then git fetch --unshallow; fi
julia -e 'versioninfo(); Pkg.init();'
julia -e 'Pkg.clone("https://github.com/saltpork/Stage.jl"); cd(Pkg.dir("Stage")); run(`git checkout last-0.3-release`);'
julia -e 'Pkg.clone("https://github.com/mit-nlp/Ollam.jl");'
julia -e 'Pkg.clone("https://github.com/mit-nlp/Text.jl");'
julia -e 'Pkg.clone("https://github.com/trevorlewis/TextREST.jl")'
julia -e 'Pkg.build();'

