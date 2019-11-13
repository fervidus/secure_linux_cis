#
class secure_linux_cis::cis_amazon1::cis_1_1_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nodev_option_set_on_var_tmp_partition
}
