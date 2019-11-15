#
class secure_linux_cis::centos8::cis_3_4_4_2_4 {
  include secure_linux_cis::rules::ensure_IPv6_firewall_rules_exist_for_all_open_ports
}
