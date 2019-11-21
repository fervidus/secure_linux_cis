# frozen_string_literal: true

# netrc_files.rb
# Contains any .netrc files on the system

Facter.add('netrc_files') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/netrc.sh')
  end
end
