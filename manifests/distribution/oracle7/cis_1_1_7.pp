# @api private
#
class secure_linux_cis::distribution::oracle7::cis_1_1_7 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_var_tmp
}
