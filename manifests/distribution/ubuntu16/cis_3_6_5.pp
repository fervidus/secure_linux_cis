# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_3_6_5 {
  include secure_linux_cis::rules::ensure_firewall_rules_exist_for_all_open_ports
}
