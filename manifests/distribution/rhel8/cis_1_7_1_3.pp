# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_7_1_3 {
  include secure_linux_cis::rules::ensure_selinux_policy_is_configured
}
