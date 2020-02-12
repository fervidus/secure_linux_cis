# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_4_2_6 {
  include secure_linux_cis::rules::ensure_unnecessary_services_and_ports_are_not_accepted
}
