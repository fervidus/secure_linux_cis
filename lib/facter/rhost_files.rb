# frozen_string_literal: true

# rhost_files.rb
# This fact contains any .rhost files that any users may posses

Facter.add('rhost_files') do
  setcode do
    Facter::Core::Execution.exec('/tmp/cis_scripts/rhost.sh')
  end
end
