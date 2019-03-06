# frozen_string_literal: true

# duplicate_gid.rb
# Ensures no duplicate GIDs exist in /etc/group

Facter.add('duplicate_gid') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/dup_gid.sh')
  end
end
