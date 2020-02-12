# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_1_1_8 {
  include secure_linux_cis::rules::ensure_nosuid_option_set_on_var_tmp_partition
}
