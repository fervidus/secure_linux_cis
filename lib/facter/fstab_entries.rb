# frozen_string_literal: true

# fstab_entries.rb
# Get uncommented fstab entries

Facter.add('fstab_entries') do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.exec("grep -v '^\s*#' /etc/fstab | awk '{print $2}'").split("\n")
  end
end
