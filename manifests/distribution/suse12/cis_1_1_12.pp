#
class secure_linux_cis::distribution::suse12::cis_1_1_12 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log_audit
}
