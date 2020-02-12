# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_4_2_5 {
  include secure_linux_cis::rules::ensure_unnecessary_services_and_ports_are_not_accepted
}
