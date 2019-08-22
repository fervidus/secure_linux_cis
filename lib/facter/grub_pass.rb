# frozen_string_literal: true

# grub_pass.rb

Facter.add('grub_pass') do
  setcode 'grep ^GRUB2_PASSWORD= /boot/grub2/*.cfg |awk -F= "{print \$1}"'
end
