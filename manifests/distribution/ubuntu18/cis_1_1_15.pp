#
class secure_linux_cis::distribution::ubuntu18::cis_1_1_15 {
  include secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition
}
