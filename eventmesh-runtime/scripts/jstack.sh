#!/bin/bash
#
# Licensed to Apache Software Foundation (ASF) under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Apache Software Foundation (ASF) licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
set -e
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "[`date`] WARNING this script will PAUSE jvm for seconds."
pid=$(jcmd | grep EventMeshStartup | cut -d" " -f1)
jstack $pid | tee $script_path/../logs/jstack.$(date +%m%d%H%M).$pid.log
