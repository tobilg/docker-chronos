#!/bin/bash

START_FLAGS=
CHRONOS_VARIABLES=$(echo ${!CHRONOS_*})

for x in $CHRONOS_VARIABLES; do 
  START_FLAGS+="--$(echo $x | awk '{ gsub("CHRONOS_","",$0); print tolower($0)}') $(echo ${!x}) ";
done;

exec /usr/bin/chronos run_jar ${START_FLAGS}