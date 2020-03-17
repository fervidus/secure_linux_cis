# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_5_4_2_1 {
  include secure_linux_cis::rules::ensure_ipv6_default_deny_firewall_policy
}
