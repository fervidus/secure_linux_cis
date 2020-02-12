# @api private
#
class secure_linux_cis::distribution::debian9::cis_5_2_19 {
  include secure_linux_cis::rules::ensure_ssh_warning_banner_is_configured
}
