# frozen_string_literal: true

# home_directory_owner.rb
# Contains users that do not own home directories

Facter.add('home_directory_owner') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/home_dir_own.sh')
  end
end
