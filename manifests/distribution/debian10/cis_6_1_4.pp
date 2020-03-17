# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_1_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured
}
