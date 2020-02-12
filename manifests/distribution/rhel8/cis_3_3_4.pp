# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_3_4 {
  include secure_linux_cis::rules::ensure_tipc_is_disabled
}
