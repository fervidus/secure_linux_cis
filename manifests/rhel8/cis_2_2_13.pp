#
class secure_linux_cis::cis_rhel8::cis_2_2_13 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_http_proxy_server_is_not_enabled
}
