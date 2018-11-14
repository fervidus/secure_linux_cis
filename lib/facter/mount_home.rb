# mount_home.rb
# Ensures that a seperate partition exists for /home

Facter.add('mount_home') do
  setcode do
    Facter::Core::Execution.exec('mount | grep /home')
  end
end
