# @api private
#
class secure_linux_cis::distribution::oracle8::cis_3_2_3 {
  include secure_linux_cis::rules::ensure_secure_icmp_redirects_are_not_accepted
}
