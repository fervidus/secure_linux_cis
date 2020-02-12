# @api private
#
class secure_linux_cis::distribution::amazon1::cis_1_7_1_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured
}
