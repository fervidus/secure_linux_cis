#
class secure_linux_cis::cis_debian9::cis_3_4_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_tcp_wrappers_is_installed
}
