# frozen_string_literal: true

# password_group_exist.rb
# Ensures groups that are defined in /etc/passwd file but not in the /etc/group file

Facter.add('password_group_exist') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/pwd_group_exist.sh')
  end
end
