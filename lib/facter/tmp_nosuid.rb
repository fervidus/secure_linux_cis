# tmp_nosuid.rb
# Contains the mount options for /tmp, ensuring nosuid is enabled

Facter.add('tmp_nosuid') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep /tmp')
    if mounted =~ %r{nosuid}
      true
    else
      false
    end
  end
end
