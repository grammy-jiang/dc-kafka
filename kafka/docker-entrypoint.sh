#!/bin/bash

if [ -x "$(command -v $1)" ]; then
  EXE=$1
  shift

  $EXE "$@"
elif [ -x "/kafka/bin/$1.sh" ]; then
  EXE="/kafka/bin/$1.sh"
  shift

  $EXE "$@"
elif [ -x "/kafka/bin/$1" ]; then
  EXE="/kafka/bin/$1"
  shift

  $EXE "$@"
else
  echo "$1 does not exist."
  exit 1
fi
