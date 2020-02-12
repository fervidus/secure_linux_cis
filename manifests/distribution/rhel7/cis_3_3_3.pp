# @api private
#
class secure_linux_cis::distribution::rhel7::cis_3_3_3 {
  include secure_linux_cis::rules::ensure_ipv6_is_disabled
}
