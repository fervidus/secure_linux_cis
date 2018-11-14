# home_nodev.rb
# Ensures the nodev option exists for the /home partition

Facter.add('home_nodev') do
  setcode do
    home = Facter::Core::Execution.exec('mount | grep /home')
    %r{nodev}.match(home)
  end
end
