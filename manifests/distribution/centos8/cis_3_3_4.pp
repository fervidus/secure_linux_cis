# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_3_4 {
  include secure_linux_cis::rules::ensure_TIPC_is_disabled
}
