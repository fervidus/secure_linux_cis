#
class secure_linux_cis::distribution::rhel8::cis_2_2_11 {
  include secure_linux_cis::rules::ensure_dns_server_is_not_enabled
}
