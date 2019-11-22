# frozen_string_literal: true

# gnome_installed.rb
# Returns true if GNOME is installed
Facter.add('gnome_installed') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('rpm -qa | grep gnome') != ''
  end
end
Facter.add('gnome_installed') do
  confine osfamily: 'Debian'
  setcode do
    Facter::Core::Execution.exec('dpkg -l | grep gdm3') != ''
  end
end
