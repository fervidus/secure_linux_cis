#
class secure_linux_cis::distribution::rhel8::cis_2_2_9 {
  include secure_linux_cis::rules::ensure_http_server_is_not_enabled
}
