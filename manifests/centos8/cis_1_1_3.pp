#
class secure_linux_cis::cis_centos8::cis_1_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition
}
