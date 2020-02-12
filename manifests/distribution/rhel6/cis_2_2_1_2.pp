# @api private
#
class secure_linux_cis::distribution::rhel6::cis_2_2_1_2 {
  include secure_linux_cis::rules::ensure_ntp_is_configured
}
