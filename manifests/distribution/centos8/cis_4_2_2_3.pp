#
class secure_linux_cis::distribution::centos8::cis_4_2_2_3 {
  include secure_linux_cis::rules::ensure_journald_is_configured_to_write_logfiles_to_persistent_disk
}
