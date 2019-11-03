# frozen_string_literal: true

# shm_nodev.rb
# Ensures the nodev option is enabled on the /dev/shm partition

Facter.add('shm_nodev') do
  confine kernel: 'Linux'
  setcode do
    shm = Facter::Core::Execution.exec('mount | grep /dev/shm')
    if shm.match?(%r{nodev})
      true
    else
      false
    end
  end
end
