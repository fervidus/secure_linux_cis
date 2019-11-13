#
class secure_linux_cis::cis_ubuntu16::cis_2_2_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_dns_server_is_not_enabled
}
