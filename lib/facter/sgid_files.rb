# frozen_string_literal: true

# sgid_files.rb
# This fact contains SGID files, which are nearly identical to SUID files mentioned in cis_1_1_13

Facter.add('sgid_files') do
  confine kernel: 'Linux'
  setcode "df --local -P | grep -v mapper/vg[1-9] |awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000"
end
