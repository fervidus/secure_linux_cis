# frozen_string_literal: true

# home_nodev.rb
# Ensures the nodev option exists for the /home partition

Facter.add('uid_min') do
  confine kernel: 'Linux'
  setcode do
    home = Facter::Core::Execution.exec('awk \'/^\s*UID_MIN/{print $2}\' /etc/login.defs')
  end
end
