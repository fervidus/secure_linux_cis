# @api private
#
class secure_linux_cis::distribution::rhel6::cis_4_2_4 {
  include secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured
}
