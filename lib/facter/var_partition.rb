# frozen_string_literal: true

# var_partition.rb
# Checks whether a seperate partition exists for /var

Facter.add('var_partition') do
  # rubocop:disable Style/StringLiterals
  setcode do
    Facter::Core::Execution.exec("mount | grep \"/var\"")
  end
  # rubocop:enable Style/StringLiterals
end
