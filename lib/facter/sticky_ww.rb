# frozen_string_literal: true

# sticky_ww.rb
Facter.add('sticky_ww') do
  confine kernel: 'Linux'
  setcode "df --local -P | grep -v mapper/vg0[1-9] |awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 -a ! -perm -1000 2>/dev/null"
end
