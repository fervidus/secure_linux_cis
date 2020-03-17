# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_6_1 {
  include secure_linux_cis::rules::ensure_xd_nx_support_is_enabled
}
