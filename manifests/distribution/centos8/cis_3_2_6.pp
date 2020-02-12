# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_2_6 {
  include secure_linux_cis::rules::ensure_bogus_ICMP_responses_are_ignored
}
