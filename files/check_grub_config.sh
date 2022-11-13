#!/bin/bash

# IF check passes return PASSED
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT')
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*')

if [ -f "$efidir"/grub.cfg ]; then
  grep "^\s*linux" "$efidir"/grub.cfg | grep -Eq "(selinux=0|enforcing=0)" && echo "FAILED: \"$()\" exists" || echo "PASSED"
elif [ -f "$gbdir"/grub.cfg ]; then
  grep "^\s*linux" "$gbdir"/grub.cfg | grep -Eq "(selinux=0|enforcing=0)" && echo "FAILED: \"$()\" exists" || echo "PASSED"
else
   echo "FAILED"
fi