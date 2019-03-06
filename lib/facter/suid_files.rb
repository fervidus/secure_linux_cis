# frozen_string_literal: true

# suid_files.rb
# This custom fact contains all SUID files on a system, which allow users to execute with root privileges

Facter.add('suid_files') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -4000"
end
