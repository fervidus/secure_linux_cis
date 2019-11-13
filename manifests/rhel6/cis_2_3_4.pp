#
class secure_linux_cis::cis_rhel6::cis_2_3_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_telnet_client_is_not_installed
}
