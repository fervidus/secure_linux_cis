#
class secure_linux_cis::cis_ubuntu18::cis_3_6_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_default_deny_firewall_policy
}
