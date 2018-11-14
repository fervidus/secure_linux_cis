# var_tmp_partition_nosuid.rb
# Ensures the nosuid option exists on the /var/tmp partition

Facter.add('var_tmp_partition_nosuid') do
  # rubocop:disable Style/StringLiterals
  setcode do
    parsed = Facter::Core::Execution.exec("mount | grep \"/var/tmp\"")
    # rubocop:enable Style/StringLiterals
    if parsed =~ %r{nosuid}
      true
    else
      false
    end
  end
end
