# shm_nodev.rb
# Ensures the nodev option is enabled on the /dev/shm partition

Facter.add('shm_nodev') do
  setcode do
    shm = Facter::Core::Execution.exec('mount | grep /dev/shm')
    if shm =~ %r{nodev}
      true
    else
      false
    end
  end
end
