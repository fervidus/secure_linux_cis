# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_1_2 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_passwd_are_configured
}
