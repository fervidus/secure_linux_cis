#
class secure_linux_cis::debian8::cis_3_5_1_1 {
  include secure_linux_cis::rules::ensure_default_deny_firewall_policy
}
