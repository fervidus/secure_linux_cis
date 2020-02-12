# @api private
#
class secure_linux_cis::distribution::amazon1::cis_5_2_12 {
  include secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured
}
