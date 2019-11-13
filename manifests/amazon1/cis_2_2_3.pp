#
class secure_linux_cis::cis_amazon1::cis_2_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_avahi_server_is_not_enabled
}
