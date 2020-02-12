# @api private
#
class secure_linux_cis::distribution::debian9::cis_3_3_1 {
  include secure_linux_cis::rules::ensure_tcp_wrappers_is_installed
}
