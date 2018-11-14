# gnome_installed.rb
# Returns true if GNOME is installed
Facter.add('gnome_installed') do
  setcode do
    Facter::Core::Execution.exec('rpm -qa | grep gnome') != ''
  end
end
