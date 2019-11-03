# frozen_string_literal: true

# home_nodev.rb
# Ensures the nodev option exists for the /home partition

Facter.add('home_nodev') do
  confine kernel: 'Linux'
  setcode do
    home = Facter::Core::Execution.exec('mount | grep /home')
    %r{nodev}.match(home)
  end
end
