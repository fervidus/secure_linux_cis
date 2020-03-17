# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_6_3 {
  include secure_linux_cis::rules::ensure_prelink_is_disabled
}
