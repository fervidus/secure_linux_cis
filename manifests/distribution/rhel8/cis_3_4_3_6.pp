# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_4_3_6 {
  include secure_linux_cis::rules::ensure_default_deny_firewall_policy
}
