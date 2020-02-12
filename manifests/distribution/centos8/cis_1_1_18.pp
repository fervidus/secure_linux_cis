# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_1_18 {
  include secure_linux_cis::rules::ensure_nodev_option_set_on_removable_media_partitions
}
