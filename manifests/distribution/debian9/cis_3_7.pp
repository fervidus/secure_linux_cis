# @api private
#
class secure_linux_cis::distribution::debian9::cis_3_7 {
  include secure_linux_cis::rules::ensure_ipv6_is_disabled
}
