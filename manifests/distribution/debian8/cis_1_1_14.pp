#
class secure_linux_cis::distribution::debian8::cis_1_1_14 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_dev_shm_partition
}
