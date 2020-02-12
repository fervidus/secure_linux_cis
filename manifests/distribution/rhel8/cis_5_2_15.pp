# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_2_15 {
  include secure_linux_cis::rules::ensure_ssh_warning_banner_is_configured
}
