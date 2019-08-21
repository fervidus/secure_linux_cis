# frozen_string_literal: true

# automounting.rb
# Ensures automounting is enabled

Facter.add('automounting') do
  confine osfamily: 'RedHat'
  setcode 'systemctl is-enabled autofs'
end
