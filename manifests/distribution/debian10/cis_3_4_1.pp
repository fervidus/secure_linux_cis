# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_4_1 {
  include secure_linux_cis::rules::ensure_dccp_is_disabled
}
