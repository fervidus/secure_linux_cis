# @api private
#
class secure_linux_cis::distribution::debian8::cis_1_1_3 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition
}
