# @api private
#
class secure_linux_cis::distribution::rhel6::cis_2_1_5 {
  include secure_linux_cis::rules::ensure_time_services_are_not_enabled
}
