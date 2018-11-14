# world_writable.rb
# Custom fact that contains all files that are world writable,
# which are security risks

Facter.add('world_writable') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002"
end
