#
class secure_linux_cis::ubuntu18::cis_3_6_2 {
  include secure_linux_cis::rules::ensure_default_deny_firewall_policy
}
