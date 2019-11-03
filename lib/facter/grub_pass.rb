# frozen_string_literal: true

# grub_pass.rb

Facter.add('grub_pass') do
  confine osfamily:  'RedHat'
  setcode 'grep ^GRUB2_PASSWORD= {/boot/grub2/*.cfg,/boot/efi/EFI/*/*.cfg} 2>/dev/null | awk -F= "{print \$1}"'
end
Facter.add('grub_pass') do
  confine osfamily:  'Debian'
  setcode 'grep "^set superusers=" /boot/grub/*.cfg /boot/efi/EFI/*/*.cfg 2>/dev/null | awk -F= "{print \$1}"'
end
