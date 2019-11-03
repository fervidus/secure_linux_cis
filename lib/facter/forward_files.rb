# frozen_string_literal: true

# forward_files.rb
# Contains any .forward files that may exist on a system

Facter.add('forward_files') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/forward.sh')
  end
end
