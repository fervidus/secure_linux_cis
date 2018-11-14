# forward_files.rb
# Contains any .forward files that may exist on a system

Facter.add('forward_files') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/forward.sh')
  end
end
