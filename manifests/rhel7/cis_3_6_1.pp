#
class secure_linux_cis::cis_rhel7::cis_3_6_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_iptables_is_installed
}
