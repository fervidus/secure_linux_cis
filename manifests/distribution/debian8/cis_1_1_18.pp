# @api private
#
class secure_linux_cis::distribution::debian8::cis_1_1_18 {
  include secure_linux_cis::rules::ensure_nosuid_option_set_on_removable_media_partitions
}
