#!/bin/bash

SOL_SANDBOXNAME="production"
SOL_PROPFILE="$HOME/solenopsis.properties"
SOL_HOMEDIR="$HOME/.solenopsis"
SOL_CREDDIR="$SOL_HOMEDIR/credentials"
SOL_CREDFILE="$SOL_CREDDIR/$SOL_SANDBOXNAME.properties"

SRC_DIR="$TRAVIS_BUILD_DIR/src"
cat >$SOL_PROPFILE <<EOF
solenopsis.ENVIRONMENTS=local $SOL_SANDBOXNAME
solenopsis.env.HOME=$SOL_HOMEDIR
solenopsis.env.MASTER=local
solenopsis.env.DEPENDENT=$SOL_SANDBOXNAME
solenopsis.env.local.HOME=$SRC_DIR

sf.antFile=$TRAVIS_BUILD_DIR/build/ant/ant-salesforce-35.0.jar
EOF

mkdir -p $SOL_CREDDIR

cat >$SOL_CREDFILE <<EOF
username = shraddha_abc@abc.com
password = test@test123
token = ECwx2OpMbX0M40tvlDWkcDZI
url = https://login.salesforce.com
sf.version = 35.0
EOF

cat $SOL_CREDFILE 