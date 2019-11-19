#!/bin/sh

df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null | \
  awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }' | sort
