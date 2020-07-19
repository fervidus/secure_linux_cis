# frozen_string_literal: true

# gdm_installed.rb
# Returns true if the GNOME Display Manager is installed
Facter.add('gdm_installed') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('rpm -qa | grep gdm') != ''
  end
end
Facter.add('gdm_installed') do
  confine osfamily: 'Debian'
  setcode do
    Facter::Core::Execution.exec('dpkg -l | grep gdm3') != ''
  end
end
