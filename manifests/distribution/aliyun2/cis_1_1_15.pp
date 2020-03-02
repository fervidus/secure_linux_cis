# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_1_1_15 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_dev_shm_partition
}
