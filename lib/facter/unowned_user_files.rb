# frozen_string_literal: true

# unowned_files.rb
# This custom fact contains all files that are not owned by users listed in the system

Facter.add('unowned_user_files') do
  confine osfamily: ['RedHat', 'Debian']
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser"
end
