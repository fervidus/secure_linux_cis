# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_1_2 {
  #  include secure_linux_cis::rules::ensure_tmp_is_configured
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_tmp
}
