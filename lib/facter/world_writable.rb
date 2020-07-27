# frozen_string_literal: true

# world_writable.rb
# Custom fact that contains all files that are world writable,
# which are security risks

Facter.add('world_writable') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/ensure_no_world_writable.sh'
end
