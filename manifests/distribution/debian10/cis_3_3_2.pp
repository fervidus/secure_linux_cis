# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_2 {
  include secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted
}
