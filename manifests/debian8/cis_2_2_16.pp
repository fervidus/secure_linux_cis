#
class secure_linux_cis::debian8::cis_2_2_16 {
  include secure_linux_cis::rules::ensure_rsync_service_is_not_enabled
}
