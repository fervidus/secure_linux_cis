# frozen_string_literal: true

# duplicate_user.rb
# Ensures no duplicate user names exist in /etc/passwd

Facter.add('duplicate_user') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/dup_usr.sh')
  end
end
