# frozen_string_literal: true

Facter.add('root_path') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/root_path.sh')
  end
end
