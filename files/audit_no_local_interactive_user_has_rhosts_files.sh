#!/bin/bash
interactive_user_dirs=( $(awk -F: '($7 !~ "nologin" && $7!="/bin/false" && $7!="/usr/bin/false") {print $6}' /etc/passwd) )
for interactive_user_dir in "${interactive_user_dirs[@]}"; do
  rhosts_files+=( $(find "${interactive_user_dir}" -name .rhosts) )
done
if [ -n "${rhosts_files}" ]; then
  echo "FAIL: found .rhosts files: ${rhosts_files[@]}"
  exit 1
fi
echo "PASS: no .rhosts files found."
