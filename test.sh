#!/bin/bash
try() {
  expected="$1"
  input="$2"

  echo "$input" | stack run mmudc > tmp/tmp.s
  actual=`docker exec mmudc sh -c 'cd /mmudc/tmp; gcc -o tmp.o tmp.s; ./tmp.o; echo $?'`

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

try 0 0
try 42 42
