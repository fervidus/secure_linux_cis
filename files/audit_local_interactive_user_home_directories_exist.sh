#!/usr/bin/env bash
{
  output=""
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"

  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
    [ ! -d "$home" ] && output="$output\n - User \"$user\" home directory \"$home\" doesn't exist"
  done

  if [ -n "$output" ]; then
    echo -e "\n- FAIL:\n${output}\n"
    exit 1
  fi
  echo -e "\n-PASS: - All local interactive users have a home directory\n"
}
