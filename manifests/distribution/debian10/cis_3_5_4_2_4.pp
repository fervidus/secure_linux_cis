# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_5_4_2_4 {
  include secure_linux_cis::rules::ensure_ipv6_firewall_rules_exist_for_all_open_ports
}
