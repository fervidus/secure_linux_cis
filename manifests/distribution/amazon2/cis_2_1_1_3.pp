# @api private
#
class secure_linux_cis::distribution::amazon2::cis_2_1_1_3 {
  include secure_linux_cis::rules::ensure_chrony_is_configured
}
