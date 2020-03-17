# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_3 {
  include secure_linux_cis::rules::ensure_secure_icmp_redirects_are_not_accepted
}
