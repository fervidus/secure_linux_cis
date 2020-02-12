# @api private
#
class secure_linux_cis::distribution::debian8::cis_1_1_9 {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition
}
