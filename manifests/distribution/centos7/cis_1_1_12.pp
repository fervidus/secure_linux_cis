# @api private
#
class secure_linux_cis::distribution::centos7::cis_1_1_12 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log_audit
}
