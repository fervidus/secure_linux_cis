#
class secure_linux_cis::debian8::cis_2_2_8 {
  include secure_linux_cis::rules::ensure_dns_server_is_not_enabled
}
