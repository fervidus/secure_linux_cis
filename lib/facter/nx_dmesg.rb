# frozen_string_literal: true

# nx_dmesg.rb

Facter.add('nx_dmesg') do
  confine osfamily: 'RedHat'
  setcode 'dmesg | grep "NX (Execute Disable) protection: active"'
end
