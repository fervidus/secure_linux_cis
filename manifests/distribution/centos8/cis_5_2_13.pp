# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_13 {
  include secure_linux_cis::rules::ensure_SSH_Idle_Timeout_Interval_is_configured
}
