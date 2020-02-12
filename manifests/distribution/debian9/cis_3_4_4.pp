# @api private
#
class secure_linux_cis::distribution::debian9::cis_3_4_4 {
  include secure_linux_cis::rules::ensure_tipc_is_disabled
}
