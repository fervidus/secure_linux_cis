# home_directory_owner.rb
# Contains users that do not own home directories

Facter.add('home_directory_owner') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/home_dir_own.sh')
  end
end
