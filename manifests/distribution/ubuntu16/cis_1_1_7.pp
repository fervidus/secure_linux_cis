# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_1_1_7 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_var_tmp_partition
}
