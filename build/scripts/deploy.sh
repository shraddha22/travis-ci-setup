#!/bin/bash

set -e

SOL_ROOT="$TRAVIS_BUILD_DIR/build/solenopsis/scripts"

cd $SOL_ROOT 
- chmod +x ./bsolenopsis
-./bsolenopsis destructive-push