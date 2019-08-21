# frozen_string_literal: true

# duplicate_group.rb
# Ensures no duplicate group names exist in /etc/group

Facter.add('duplicate_group') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/dup_group.sh')
  end
end
