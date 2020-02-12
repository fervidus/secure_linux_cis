# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_8_1_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured
}
