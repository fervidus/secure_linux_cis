# frozen_string_literal: true

# grub_pass.rb

Facter.add('grub_pass') do
  setcode 'grep "^GRUB2 PASSWORD" /boot/grub2/grub.cfg'
end
