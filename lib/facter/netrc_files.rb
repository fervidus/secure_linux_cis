# netrc_files.rb
# Contains any .netrc files on the system

Facter.add('netrc_files') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/netrc.sh')
  end
end
