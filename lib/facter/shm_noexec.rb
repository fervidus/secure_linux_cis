# shm_noexec.rb
# Ensures the noexec option is enabled on the /deev/shm partition

Facter.add('shm_noexec') do
  setcode do
    shmne = Facter::Core::Execution.exec('mount | grep /dev/shm')
    if shmne =~ %r{noexec}
      true
    else
      false
    end
  end
end
