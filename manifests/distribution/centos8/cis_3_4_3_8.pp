#
class secure_linux_cis::distribution::centos8::cis_3_4_3_8 {
  include secure_linux_cis::rules::ensure_nftables_rules_are_permanent
}
