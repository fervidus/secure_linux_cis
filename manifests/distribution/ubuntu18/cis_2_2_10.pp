#
class secure_linux_cis::distribution::ubuntu18::cis_2_2_10 {
  include secure_linux_cis::rules::ensure_http_server_is_not_enabled
}
