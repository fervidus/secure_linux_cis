# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_7_1_1 {
  include secure_linux_cis::rules::ensure_apparmor_is_installed
}
