#
class secure_linux_cis::cis_debian9::cis_1_1_14 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nodev_option_set_on_home_partition
}
