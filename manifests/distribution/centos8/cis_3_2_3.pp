# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_2_3 {
  include secure_linux_cis::rules::ensure_secure_ICMP_redirects_are_not_accepted
}
