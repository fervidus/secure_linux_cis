#!/bin/bash
interactive_user_dirs=( $(awk -F: '($7 !~ "nologin" && $7!="/bin/false" && $7!="/usr/bin/false") {print $6}' /etc/passwd) )
for interactive_user_dir in "${interactive_user_dirs[@]}"; do
  find "${interactive_user_dir}" -name .rhosts -exec rm -v {} \;
done

