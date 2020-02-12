# @api private
#
class secure_linux_cis::distribution::amazon2::cis_3_5_2_1 {
  include secure_linux_cis::rules::ensure_ipv6_default_deny_firewall_policy
}
