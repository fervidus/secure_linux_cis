# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_7_1_3 {
  include secure_linux_cis::rules::ensure_SELinux_policy_is_configured
}
