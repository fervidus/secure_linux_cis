# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_6 {
  include secure_linux_cis::rules::ensure_bogus_icmp_responses_are_ignored
}
