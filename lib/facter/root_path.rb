Facter.add('root_path') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/root_path.sh')
  end
end
