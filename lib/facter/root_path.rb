# frozen_string_literal: true

Facter.add('root_path') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/applications/cis_scripts/root_path.sh')
  end
end
