# frozen_string_literal: true

# world_writable_redhat.rb
# Custom fact that contains all files that are world writable,
# which are security risks

Facter.add('world_writable_redhat') do
  setcode 'df --local -P | awk {&#039;if (NR!=1) print $6&#039;} | xargs -I &#039;{}&#039; find &#039;{}&#039; -xdev -type f -perm -0002'
end
