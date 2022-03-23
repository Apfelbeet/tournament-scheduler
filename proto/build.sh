#!/bin/bash

cd ../server/scripts
./proto_build.sh

cd ../..

cd client/tournament_scheduler_client/scripts
./proto_build.sh
