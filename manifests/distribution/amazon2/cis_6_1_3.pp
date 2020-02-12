# @api private
#
class secure_linux_cis::distribution::amazon2::cis_6_1_3 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured
}
