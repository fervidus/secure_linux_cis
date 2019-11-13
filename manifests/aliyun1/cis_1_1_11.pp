#
class secure_linux_cis::cis_aliyun1::cis_1_1_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log
}
