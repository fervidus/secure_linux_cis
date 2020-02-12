# @api private
#
class secure_linux_cis::distribution::amazon1::cis_1_1_11 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log
}
