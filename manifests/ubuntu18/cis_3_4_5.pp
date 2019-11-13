#
class secure_linux_cis::cis_ubuntu18::cis_3_4_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_hosts_deny_are_configured
}
