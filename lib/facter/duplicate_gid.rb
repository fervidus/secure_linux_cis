# frozen_string_literal: true

# duplicate_gid.rb
# Ensures no duplicate GIDs exist in /etc/group

Facter.add('duplicate_gid') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/dup_gid.sh')
  end
end
