#
class secure_linux_cis::centos8::cis_3_4_4_1_1 {
  include secure_linux_cis::rules::ensure_default_deny_firewall_policy
}