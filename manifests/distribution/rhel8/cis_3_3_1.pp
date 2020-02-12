# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_3_1 {
  include secure_linux_cis::rules::ensure_dccp_is_disabled
}
