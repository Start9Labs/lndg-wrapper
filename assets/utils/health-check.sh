#!/bin/bash

DURATION=$(</dev/stdin)
if (($DURATION <= 10000 )); then
    exit 60
else
    curl --silent lndg.embassy:8889 &>/dev/null
    RES=$?
    if test "$RES" != 0; then
        echo "The LNDg UI is unreachable" >&2
        exit 1
    fi
fi