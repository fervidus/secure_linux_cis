# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_3_1 {
  include secure_linux_cis::rules::ensure_sudo_is_installed
}
