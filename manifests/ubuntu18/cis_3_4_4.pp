#
class secure_linux_cis::cis_ubuntu18::cis_3_4_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_hosts_allow_are_configured
}
