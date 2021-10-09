#!/bin/sh

use_module ()
{
    sed -i \
        -e 's/^import \* as aModule from .*;/import * as aModule from "'$1'";/g' \
        -e 's!^export function getLoadedModuleName() .*!export function getLoadedModuleName() { return "'"$1"'";}!g' \
        errmodule.ts
}

for m in zwave-js ts-md5
do

    echo "==> Checking with $m with tsc and ts-node on js file:"
    use_module $m
    cmd="rm -fr dist; tsc; ts-node dist/err_check.js"
    echo \$ $cmd
    sh -c "$cmd"
    echo

    echo "==> Checking with $m with ts-node:"
    use_module $m
    cmd="ts-node err_check.ts"
    echo \$ $cmd
    $cmd
    echo


done



