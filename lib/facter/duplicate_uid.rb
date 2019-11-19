# frozen_string_literal: true

# duplicate_uid.rb
# Ensures there are no duplicate UIDs in /etc/passwd

Facter.add('duplicate_uid') do
  confine osfamily: ['RedHat', 'Debian']
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/dup_uid.sh')
  end
end
