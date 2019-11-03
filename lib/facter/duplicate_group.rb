# frozen_string_literal: true

# duplicate_group.rb
# Ensures no duplicate group names exist in /etc/group

Facter.add('duplicate_group') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/dup_group.sh')
  end
end
