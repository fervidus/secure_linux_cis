# @api private
#
class secure_linux_cis::distribution::amazon2::cis_2_1_1_2 {
  include secure_linux_cis::rules::ensure_ntp_is_configured
}
