# @api private
#
class secure_linux_cis::distribution::oracle7::cis_1_4_2 {
  include secure_linux_cis::rules::ensure_bootloader_password_is_set
}
