# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_6_2 {
  include secure_linux_cis::rules::ensure_default_deny_firewall_policy
}
