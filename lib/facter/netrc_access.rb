# frozen_string_literal: true

# netrc_access.rb
# Contains .netrc files that are either group or world accessible

Facter.add('netrc_access') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/netrc_access.sh')
  end
end
