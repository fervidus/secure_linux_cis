#
class secure_linux_cis::cis_centos7::cis_2_3_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_rsh_client_is_not_installed
}
