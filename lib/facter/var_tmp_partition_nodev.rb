# var_tmp_partition_parsed.rb
# Parses the var_tmp_partition custom fact to ensure nodev option is set

Facter.add('var_tmp_partition_nodev') do
  # rubocop:disable Style/StringLiterals
  setcode do
    parsed = Facter::Core::Execution.exec("mount | grep \"/var/tmp\"")
    # rubocop:enable Style/StringLiterals
    if parsed =~ %r{nodev}
      true
    else
      false
    end
  end
end
