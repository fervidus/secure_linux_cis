# @api private
#
class secure_linux_cis::distribution::oracle8::cis_5_2_13 {
  include secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured
}
