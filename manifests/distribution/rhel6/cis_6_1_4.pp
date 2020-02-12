# @api private
#
class secure_linux_cis::distribution::rhel6::cis_6_1_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_group_are_configured
}
