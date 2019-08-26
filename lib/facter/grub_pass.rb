# frozen_string_literal: true

# grub_pass.rb

Facter.add('grub_pass') do
  confine osfamily: 'RedHat'
  setcode 'grep ^GRUB2_PASSWORD= /boot/grub2/*.cfg |awk -F= "{print \$1}"'
end
