#
class secure_linux_cis::centos8::cis_2_2_6 {
  include secure_linux_cis::rules::ensure_HTTP_Proxy_Server_is_not_enabled
}
