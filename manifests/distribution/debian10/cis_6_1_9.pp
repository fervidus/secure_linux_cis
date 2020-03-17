# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_1_9 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_gshadow__are_configured
}
