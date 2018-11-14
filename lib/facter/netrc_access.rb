# netrc_access.rb
# Contains .netrc files that are either group or world accessible

Facter.add('netrc_access') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/netrc_access.sh')
  end
end
