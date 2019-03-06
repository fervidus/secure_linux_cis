# frozen_string_literal: true

# sticky_ww.rb
Facter.add('sticky_ww') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null"
end
