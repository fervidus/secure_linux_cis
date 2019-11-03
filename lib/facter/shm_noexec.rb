# frozen_string_literal: true

# shm_noexec.rb
# Ensures the noexec option is enabled on the /deev/shm partition

Facter.add('shm_noexec') do
  confine kernel: 'Linux'
  setcode do
    shmne = Facter::Core::Execution.exec('mount | grep /dev/shm')
    if shmne.match?(%r{noexec})
      true
    else
      false
    end
  end
end
