#
class secure_linux_cis::cis_amazon1::cis_1_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_separate_partition_exists_for_tmp
}
