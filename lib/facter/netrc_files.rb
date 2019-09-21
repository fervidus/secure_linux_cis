# frozen_string_literal: true

# netrc_files.rb
# Contains any .netrc files on the system

Facter.add('netrc_files') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/netrc.sh')
  end
end
