# frozen_string_literal: true

Facter.add('root_path') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/root_path.sh')
  end
end
