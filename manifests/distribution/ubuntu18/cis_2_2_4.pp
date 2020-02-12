# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_2_2_4 {
  include secure_linux_cis::rules::ensure_cups_is_not_enabled
}
