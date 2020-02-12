# @api private
#
class secure_linux_cis::distribution::rhel8::cis_2_2_13 {
  include secure_linux_cis::rules::ensure_rpc_is_not_enabled
}
