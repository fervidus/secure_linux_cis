#
class secure_linux_cis::cis_rhel7::cis_1_1_12 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log_audit
}
