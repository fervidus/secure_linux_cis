# frozen_string_literal: true

# sgid_files.rb
# This fact contains SGID files, which are nearly identical to SUID files mentioned in cis_1_1_13

Facter.add('sgid_files') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/audit_sgid.sh'
end
