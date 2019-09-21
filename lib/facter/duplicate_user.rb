# frozen_string_literal: true

# duplicate_user.rb
# Ensures no duplicate user names exist in /etc/passwd

Facter.add('duplicate_user') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/dup_usr.sh')
  end
end
