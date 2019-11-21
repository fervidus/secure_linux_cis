# frozen_string_literal: true

# shm_nosuid.rb
# Ensures the nosuid option is enabled for the /dev/shm partition

Facter.add('shm_nosuid') do
  confine kernel: 'Linux'
  setcode do
    shmns = Facter::Core::Execution.exec('mount | grep /dev/shm')
    if shmns.match?(%r{nosuid})
      true
    else
      false
    end
  end
end
