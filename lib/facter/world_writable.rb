# frozen_string_literal: true

# world_writable.rb
# Custom fact that contains all files that are world writable,
# which are security risks

Facter.add('world_writable') do
  confine kernel: 'Linux'
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002"
end
