#
class secure_linux_cis::oracle6::cis_1_1_20 {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions
}
