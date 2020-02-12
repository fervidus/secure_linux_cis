# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_7_1_4 {
  include secure_linux_cis::rules::ensure_the_SELinux_state_is_enforcing
}
