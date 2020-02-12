# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_15 {
  include secure_linux_cis::rules::ensure_SSH_warning_banner_is_configured
}
