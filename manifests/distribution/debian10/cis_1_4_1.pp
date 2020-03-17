# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_4_1 {
  include secure_linux_cis::rules::ensure_aide_is_installed
}
