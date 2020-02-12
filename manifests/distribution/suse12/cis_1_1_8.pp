# @api private
#
class secure_linux_cis::distribution::suse12::cis_1_1_8 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_var_tmp_partition
}
