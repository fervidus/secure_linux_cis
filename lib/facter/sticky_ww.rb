# frozen_string_literal: true

# sticky_ww.rb
Facter.add('sticky_ww') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/ensure_sticky_ww.sh'
end
