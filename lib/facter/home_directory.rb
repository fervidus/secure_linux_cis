# home_directory.rb

Facter.add('home_directory') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/home_directory.sh')
  end
end
