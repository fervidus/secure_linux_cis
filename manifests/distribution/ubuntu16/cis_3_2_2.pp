# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_3_2_2 {
  include secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted
}
