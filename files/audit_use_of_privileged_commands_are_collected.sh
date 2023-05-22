for PARTITION in $(findmnt -n -l -k -it $(awk '/nodev/ { print $2 }' /proc/filesystems | paste -sd,) | grep -Pv "noexec|nosuid" | awk '{print $1}'); do
  for PRIVILEGED in $(find "${PARTITION}" -xdev -perm /6000 -type f); do
    if ! grep -qr "${PRIVILEGED}" /etc/audit/rules.d; then
      printf "WARN: '${PRIVILEGED}' not found in on disk configuration.\n"
      exit 1
    fi
    printf "PASS: '${PRIVILEGED}' found in auditing rules.\n" \
  done
done
