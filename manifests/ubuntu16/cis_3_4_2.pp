#
class secure_linux_cis::cis_ubuntu16::cis_3_4_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_etc_hosts_allow_is_configured
}
