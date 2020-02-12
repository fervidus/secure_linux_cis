# @api private
#
class secure_linux_cis::distribution::centos7::cis_2_1_3 {
  include secure_linux_cis::rules::ensure_discard_services_are_not_enabled
}
