#
class secure_linux_cis::cis_amazon1::cis_6_1_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist
}
