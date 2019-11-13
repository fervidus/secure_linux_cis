#
class secure_linux_cis::cis_oracle6::cis_6_1_12 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_ungrouped_files_or_directories_exist
}
