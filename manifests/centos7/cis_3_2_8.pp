#
class secure_linux_cis::cis_centos7::cis_3_2_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_tcp_syn_cookies_is_enabled
}
