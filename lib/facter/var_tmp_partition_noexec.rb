# frozen_string_literal: true

# var_tmp_partition_noexec.rb
# This ensures the noexec option exists for the /var/tmp partition

Facter.add('var_tmp_partition_noexec') do
  # rubocop:disable Style/StringLiterals
  setcode do
    parsed = Facter::Core::Execution.exec("mount | grep \"/var/tmp\"")
    # rubocop:enable Style/StringLiterals
    if parsed.match?(%r{noexec})
      true
    else
      false
    end
  end
end
