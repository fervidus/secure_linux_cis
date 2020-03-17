# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_5 {
  include secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected
}
