#
class secure_linux_cis::cis_amazon2::cis_1_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_separate_partition_exists_for_var
}
