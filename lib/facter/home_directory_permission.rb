# frozen_string_literal: true

# home_directory_permission.rb
# Contains all user directories that have permissions less restrictive than 750

Facter.add('home_directory_permission') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/home_dir_perm.sh')
  end
end
