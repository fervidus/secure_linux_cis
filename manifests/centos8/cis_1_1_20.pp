#
class secure_linux_cis::cis_centos8::cis_1_1_20 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions
}
