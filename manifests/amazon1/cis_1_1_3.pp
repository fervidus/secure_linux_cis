#
class secure_linux_cis::amazon1::cis_1_1_3 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition
}
