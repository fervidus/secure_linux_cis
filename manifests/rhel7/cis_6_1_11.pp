#
class secure_linux_cis::cis_rhel7::cis_6_1_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist
}
