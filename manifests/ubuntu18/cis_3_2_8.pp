#
class secure_linux_cis::cis_ubuntu18::cis_3_2_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_tcp_syn_cookies_is_enabled
}
