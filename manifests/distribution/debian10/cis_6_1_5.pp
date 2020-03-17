# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_1_5 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_group_are_configured
}
