# @api private
#
class secure_linux_cis::distribution::amazon1::cis_1_4_3 {
  include secure_linux_cis::rules::ensure_interactive_boot_is_not_enabled
}
