# frozen_string_literal: true

# var_log_audit.rb
# Ensures a seperate partition exists for /var/log/audit

Facter.add('var_log_audit') do
  confine kernel: 'Linux'
  # rubocop:disable Style/StringLiterals
  setcode do
    Facter::Core::Execution.exec("mount | grep \"/var/log/audit\"")
  end
  # rubocop:enable Style/StringLiterals
end
