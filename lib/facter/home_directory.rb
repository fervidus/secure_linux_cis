# frozen_string_literal: true

# home_directory.rb

Facter.add('home_directory') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/home_directory.sh')
  end
end
