# frozen_string_literal: true

# forward_files.rb
# Contains any .forward files that may exist on a system

Facter.add('forward_files') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/forward.sh')
  end
end
