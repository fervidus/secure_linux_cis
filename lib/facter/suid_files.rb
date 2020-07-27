# frozen_string_literal: true

# suid_files.rb
# This custom fact contains all SUID files on a system, which allow users to execute with root privileges

Facter.add('suid_files') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/audit_suid.sh'
end
