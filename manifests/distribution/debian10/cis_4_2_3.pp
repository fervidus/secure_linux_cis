# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_2_3 {
  include secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured
}
