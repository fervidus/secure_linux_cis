# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_9 {
  include secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected
}
