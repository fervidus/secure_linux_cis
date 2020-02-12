# @api private
#
class secure_linux_cis::distribution::debian8::cis_1_1_19 {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions
}
