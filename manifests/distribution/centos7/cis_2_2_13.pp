#
class secure_linux_cis::distribution::centos7::cis_2_2_13 {
  include secure_linux_cis::rules::ensure_http_proxy_server_is_not_enabled
}
