# frozen_string_literal: true

# rhost_files.rb
# This fact contains any .rhost files that any users may posses

Facter.add('rhost_files') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/rhost.sh')
  end
end
