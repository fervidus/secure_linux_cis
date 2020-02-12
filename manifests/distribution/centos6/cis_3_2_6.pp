# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_2_6 {
  include secure_linux_cis::rules::ensure_bogus_icmp_responses_are_ignored
}
