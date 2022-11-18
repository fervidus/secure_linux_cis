# frozen_string_literal: true

Facter.add('root_path') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('sudo -Hiu root env | grep \'^PATH\' | cut -d= -f2')
  end
end
