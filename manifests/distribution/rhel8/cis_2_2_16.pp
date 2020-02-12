# @api private
#
class secure_linux_cis::distribution::rhel8::cis_2_2_16 {
  include secure_linux_cis::rules::ensure_cups_is_not_enabled
}
