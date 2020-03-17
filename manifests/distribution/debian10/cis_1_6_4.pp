# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_6_4 {
  include secure_linux_cis::rules::ensure_core_dumps_are_restricted
}
