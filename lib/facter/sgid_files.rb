# sgid_files.rb
# This fact contains SGID files, which are nearly identical to SUID files mentioned in cis_1_1_13

Facter.add('sgid_files') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000"
end
