# @api private
#
class secure_linux_cis::distribution::debian9::cis_5_2_16 {
  include secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured
}
