#!/usr/bin/env bash
{
  output=""
  perm_mask='0027'
  maxperm="$( printf '%o' $(( 0777 & ~$perm_mask)) )"
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
    if [ -d "$home" ]; then
      mode=$( stat -L -c '%#a' "$home" )
      [ $(( $mode & $perm_mask )) -gt 0 ] && output="$output\n- User $user home directory: \"$home\" is too permissive: \"$mode\" (should be: \"$maxperm\" or more restrictive)"
    fi
  done

  if [ -n "$output" ]; then
    echo -e "\n- FAIL:\n${output}\n"
    exit 1
  fi
  echo -e "\n- PASS:\n- All user home directories are mode: \"$maxperm\" or more restrictive"
}
